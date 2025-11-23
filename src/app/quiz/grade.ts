'use server'

import { GoogleGenerativeAI } from '@google/generative-ai'

export async function gradeCode(question: string, userCode: string) {
  const apiKey = process.env.GEMINI_API_KEY

  if (!apiKey) {
    return { error: 'API key not configured' }
  }

  const genAI = new GoogleGenerativeAI(apiKey)
  const model = genAI.getGenerativeModel({ model: 'gemini-2.0-flash' })

  const prompt = `
    You are a strict code grader.
    
    Question: ${question}
    
    User's Code:
    \`\`\`
    ${userCode}
    \`\`\`
    
    Evaluate if the user's code correctly solves the problem.
    Ignore minor formatting issues, but ensure logic and syntax are correct.
    
    Respond with a JSON object ONLY:
    {
      "correct": boolean,
      "feedback": "Short explanation of why it is correct or incorrect"
    }
  `

  try {
    const result = await model.generateContent(prompt)
    const response = await result.response
    const text = response.text()

    // Clean up markdown code blocks if present
    const jsonStr = text.replace(/```json/g, '').replace(/```/g, '').trim()

    return JSON.parse(jsonStr)
  } catch (error: any) {
    console.error('Error grading code:', error)

    // Check for specific error types
    if (error.message?.includes('API key')) {
      return { error: 'Gemini API key is invalid or missing.' }
    }

    if (error instanceof SyntaxError) {
      console.error('Failed to parse JSON response:', error)
      return { error: 'AI response was not valid JSON. Please try again.' }
    }

    return { error: `Failed to grade code: ${error.message || 'Unknown error'}` }
  }
}
