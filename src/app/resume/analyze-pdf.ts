'use server'

import { GoogleGenerativeAI } from '@google/generative-ai'
// @ts-ignore
import PDFParser from 'pdf2json'

export async function analyzePdfResume(formData: FormData) {
    const file = formData.get('file') as File

    if (!file) {
        return { error: 'No file uploaded' }
    }

    const apiKey = process.env.GEMINI_API_KEY
    if (!apiKey) {
        return { error: 'API key not configured' }
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

        const genAI = new GoogleGenerativeAI(apiKey)
        const model = genAI.getGenerativeModel({ model: 'gemini-2.0-flash' })

        const prompt = `
        Analyze the following resume text and provide constructive feedback with scores.
        
        IMPORTANT: Respond with a VALID JSON object ONLY. Do not include any markdown formatting, backticks, or explanations outside the JSON.
        Ensure all strings are properly escaped. Do NOT use unescaped control characters (like newlines) inside JSON strings.
        
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

        const result = await model.generateContent(prompt)
        const response = await result.response
        const text = response.text()

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
            // Fallback: Try to escape newlines inside the string
            // This is risky but might save a bad response
            const fixedJson = jsonStr.replace(/\n/g, "\\n").replace(/\r/g, "\\r").replace(/\t/g, "\\t");
            return JSON.parse(fixedJson);
        }

    } catch (error: any) {
        console.error('Error analyzing PDF:', error)
        return { error: error.message || 'Failed to analyze PDF' }
    }
}
