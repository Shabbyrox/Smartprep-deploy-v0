'use server'

import { GoogleGenerativeAI } from '@google/generative-ai'

export async function analyzeResume(resumeContent: any) {
    const apiKey = process.env.GEMINI_API_KEY

    if (!apiKey) {
        return { error: 'API key not configured' }
    }

    const genAI = new GoogleGenerativeAI(apiKey)
    const model = genAI.getGenerativeModel({ model: 'gemini-2.0-flash' })

    const prompt = `
    Analyze the following resume data and provide constructive feedback with scores.
    
    IMPORTANT: Respond with a VALID JSON object ONLY. Do not include any markdown formatting, backticks, or explanations outside the JSON.
    Ensure all strings are properly escaped.
    
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
        "feedback": "Detailed markdown feedback focusing on strengths, weaknesses, and suggestions."
    }

    Resume Data:
    ${JSON.stringify(resumeContent, null, 2)}
  `

    try {
        const result = await model.generateContent(prompt)
        const response = await result.response
        const text = response.text()

        // Robust JSON extraction
        const jsonMatch = text.match(/\{[\s\S]*\}/);
        const jsonStr = jsonMatch ? jsonMatch[0] : text;

        return JSON.parse(jsonStr)
    } catch (error: any) {
        console.error('Error analyzing resume:', error)
        return { error: error.message || 'Failed to analyze resume' }
    }
}
