'use server'

import { GoogleGenerativeAI } from '@google/generative-ai'
// @ts-ignore
import PDFParser from 'pdf2json'

export async function analyzeResumeWithJD(formData: FormData) {
    const file = formData.get('file') as File
    const jobRole = formData.get('jobRole') as string
    const jobDescription = formData.get('jobDescription') as string

    if (!file) return { error: 'No file uploaded' }
    if (!jobRole) return { error: 'Job Role is required' }
    if (!jobDescription) return { error: 'Job Description is required' }

    const apiKey = process.env.GEMINI_API_KEY
    if (!apiKey) return { error: 'API key not configured' }

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

        const genAI = new GoogleGenerativeAI(apiKey)
        const model = genAI.getGenerativeModel({ model: 'gemini-2.0-flash' })

        const prompt = `
        You are an expert ATS (Applicant Tracking System) and Hiring Manager.
        Analyze the following resume against the provided Job Description (JD) for the role of "${jobRole}".
        
        Job Description:
        ${jobDescription}

        Resume Text:
        ${resumeText}

        IMPORTANT: Respond with a VALID JSON object ONLY. Do not include any markdown formatting, backticks, or explanations outside the JSON.
        
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

        const result = await model.generateContent(prompt)
        const response = await result.response
        const text = response.text()

        // JSON extraction and sanitization
        const jsonMatch = text.match(/\{[\s\S]*\}/);
        let jsonStr = jsonMatch ? jsonMatch[0] : text;

        jsonStr = jsonStr.replace(/[\x00-\x1F\x7F-\x9F]/g, (char) => {
            if (char === '\n' || char === '\t' || char === '\r') return char;
            return '';
        });

        try {
            return JSON.parse(jsonStr)
        } catch (e) {
            const fixedJson = jsonStr.replace(/\n/g, "\\n").replace(/\r/g, "\\r").replace(/\t/g, "\\t");
            return JSON.parse(fixedJson);
        }

    } catch (error: any) {
        console.error('Error analyzing Resume with JD:', error)
        return { error: error.message || 'Failed to analyze resume' }
    }
}
