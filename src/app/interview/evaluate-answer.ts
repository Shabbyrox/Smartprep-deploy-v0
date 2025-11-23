'use server'

import { GoogleGenerativeAI } from '@google/generative-ai'

export async function evaluateAnswer(
    question: string,
    answer: string,
    jobRole: string
) {
    const apiKey = process.env.GEMINI_API_KEY
    if (!apiKey) return { error: 'API key not configured' }

    try {
        const genAI = new GoogleGenerativeAI(apiKey)
        const model = genAI.getGenerativeModel({ model: 'gemini-2.0-flash' })

        const prompt = `
You are an expert interviewer evaluating a candidate's answer for the role of "${jobRole}".

Question: ${question}
Candidate's Answer: ${answer}

Provide a brief evaluation. Respond with VALID JSON ONLY:
{
    "score": number (0-10),
    "feedback": "Brief 1-2 sentence feedback on the answer quality"
}
`

        const result = await model.generateContent(prompt)
        const response = await result.response
        const text = response.text()

        const jsonMatch = text.match(/\{[\s\S]*\}/)
        const jsonStr = jsonMatch ? jsonMatch[0] : text

        const evaluation = JSON.parse(jsonStr)
        return evaluation

    } catch (error: any) {
        console.error('Error evaluating answer:', error)
        return { error: error.message || 'Failed to evaluate answer' }
    }
}
