// src/app/resume/analyze-jd.ts
'use server'

import { generateContentWithRetry } from '../../utils/gemini'
import { createClient } from '@/utils/supabase/server'
// @ts-ignore
import PDFParser from 'pdf2json'

export async function analyzeResumeWithJD(formData: FormData) {
    const file = formData.get('file') as File
    const jobRole = formData.get('jobRole') as string
    const jobDescription = formData.get('jobDescription') as string

    if (!file) return { error: 'No file uploaded' }
    if (!jobRole) return { error: 'Job Role is required' }
    if (!jobDescription) return { error: 'Job Description is required' }

    try {
        const arrayBuffer = await file.arrayBuffer()
        const buffer = Buffer.from(arrayBuffer)

        // Extract text from PDF
        const pdfParser = new PDFParser(null, true)
        const resumeText = await new Promise<string>((resolve, reject) => {
            pdfParser.on('pdfParser_dataError', (errData: any) => reject(errData.parserError))
            pdfParser.on('pdfParser_dataReady', (pdfData: any) => {
                resolve(pdfParser.getRawTextContent())
            })
            pdfParser.parseBuffer(buffer)
        })

        const prompt = `
        You are an expert ATS (Applicant Tracking System) and Hiring Manager.
        Analyze the following resume against the provided Job Description (JD) for the role of "${jobRole}".
        
        Job Description:
        ${jobDescription}

        Resume Text:
        ${resumeText}

        IMPORTANT: Respond ONLY with a valid JSON object in this exact format. Do not include any text before or after the JSON. Do not use markdown code blocks. Ensure all strings are properly escaped and no trailing commas.
        
        Structure:
        {
            "matchScore": number (0-100),
            "missingKeywords": ["string", "string"],
            "feedback": "Detailed markdown feedback. 
            - Start with a summary of the fit.
            - List 'Strengths' (what matches well).
            - List 'Gaps' (what is missing from the JD).
            - Provide 'Actionable Recommendations' to tailor the resume for this specific JD.
            - Use emojis and bold text for readability."
        }
        `

        const text = await generateContentWithRetry(prompt)

        // JSON extraction and sanitization
        const jsonMatch = text.match(/\{[\s\S]*\}/);
        let jsonStr = jsonMatch ? jsonMatch[0] : text;

        jsonStr = jsonStr.replace(/[\x00-\x1F\x7F-\x9F]/g, (char) => {
            if (char === '\n' || char === '\t' || char === '\r') return char;
            return '';
        });

        try {
            const result = JSON.parse(jsonStr)
            // Save to database
            const supabase = await createClient()
            const { data: { user } } = await supabase.auth.getUser()
            if (user) {
                await supabase.from('resume_analyses').insert({
                    user_id: user.id,
                    overall_score: result.matchScore,
                    section_scores: {}, // JD match doesn't have section scores
                    feedback: result.feedback,
                    source: 'jd_match',
                    created_at: new Date().toISOString()
                })
            }
            return result
        } catch (e) {
            console.log('Initial JSON parse failed, raw response:', jsonStr)
            const fixedJson = jsonStr.replace(/\n/g, "\\n").replace(/\r/g, "\\r").replace(/\t/g, "\\t");
            try {
                return JSON.parse(fixedJson);
            } catch (e2) {
                console.error('Fixed JSON parse also failed:', fixedJson)
                return { error: 'AI returned invalid JSON. Please try again.' }
            }
        }

    } catch (error: any) {
        console.error('Error analyzing Resume with JD:', error)
        return { error: error.message || 'Failed to analyze resume' }
    }
}
