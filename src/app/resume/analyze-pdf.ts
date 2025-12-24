'use server'

import { generateContentWithRetry } from '../../utils/gemini'
// @ts-ignore
import PDFParser from 'pdf2json'

export async function analyzePdfResume(formData: FormData) {
    const file = formData.get('file') as File

    if (!file) {
        return { error: 'No file uploaded' }
    }

    try {
        const arrayBuffer = await file.arrayBuffer()
        const buffer = Buffer.from(arrayBuffer)

        // Use pdf2json to extract text
        const pdfParser = new PDFParser(null, true) // true for text content

        const resumeText = await new Promise<string>((resolve, reject) => {
            pdfParser.on('pdfParser_dataError', (errData: any) => reject(errData.parserError))
            pdfParser.on('pdfParser_dataReady', (pdfData: any) => {
                resolve(pdfParser.getRawTextContent())
            })
            pdfParser.parseBuffer(buffer)
        })

        const prompt = `
        Analyze the following resume text and provide constructive feedback with scores.
        
        IMPORTANT: Respond ONLY with a valid JSON object in this exact format. Do not include any text before or after the JSON. Do not use markdown code blocks. Ensure all strings are properly escaped and no trailing commas.
        
        Structure:
        {
            "overallScore": number (0-100),
            "sectionScores": {
                "personalInfo": number (0-100),
                "education": number (0-100),
                "projects": number (0-100),
                "skills": number (0-100),
                "achievements": number (0-100),
                "coCurricular": number (0-100)
            },
            "recommendedJobRoles": ["string (Most Compatible Role)", "string (2nd Best)", "string (3rd Best)"],
            "feedback": "Detailed, beautifully formatted markdown feedback. Use emojis (e.g., 🎯, ⚠️, 💡) for bullet points. Use bold text for key terms. Structure with clear headings (##) for 'Strengths', 'Weaknesses', and 'Actionable Suggestions'. Make it encouraging but critical."
        }

        Resume Text:
        ${resumeText}
        `

        const text = await generateContentWithRetry(prompt)

        // Robust JSON extraction and sanitization
        const jsonMatch = text.match(/\{[\s\S]*\}/);
        let jsonStr = jsonMatch ? jsonMatch[0] : text;

        // Remove bad control characters (newlines, tabs, etc. inside strings)
        // This is a basic sanitizer, for production a more robust parser might be needed
        // but this handles common Gemini JSON issues
        jsonStr = jsonStr.replace(/[\x00-\x1F\x7F-\x9F]/g, (char) => {
            // Allow newlines and tabs if they are properly escaped or part of formatting
            // But JSON.parse hates real control chars. 
            // We'll try to just strip them or replace with space if they aren't valid whitespace
            if (char === '\n' || char === '\t' || char === '\r') return char;
            return '';
        });

        // Sometimes Gemini puts newlines in strings without escaping them
        // We can try to fix this by escaping unescaped newlines in values?
        // A safer bet is to just try parsing, and if it fails, try to clean more aggressively.

        try {
            return JSON.parse(jsonStr)
        } catch (e) {
            console.log('Initial JSON parse failed, raw response:', jsonStr)
            // Fallback: Try to escape newlines inside the string
            // This is risky but might save a bad response
            const fixedJson = jsonStr.replace(/\n/g, "\\n").replace(/\r/g, "\\r").replace(/\t/g, "\\t");
            try {
                return JSON.parse(fixedJson);
            } catch (e2) {
                console.error('Fixed JSON parse also failed:', fixedJson)
                return { error: 'AI returned invalid JSON. Please try again.' }
            }
        }

    } catch (error: any) {
        console.error('Error analyzing PDF:', error)
        return { error: error.message || 'Failed to analyze PDF' }
    }
}
