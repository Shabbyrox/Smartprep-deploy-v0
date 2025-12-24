'use server'

import OpenAI from 'openai'

const apiKey = process.env.GROQ_API_KEY
if (!apiKey) {
  throw new Error('GROQ_API_KEY not configured')
}

const groq = new OpenAI({
  apiKey,
  baseURL: 'https://api.groq.com/openai/v1',
})

export async function generateContentWithRetry(prompt: string, maxRetries = 3): Promise<string> {
  let attempt = 0
  while (attempt < maxRetries) {
    try {
      const completion = await groq.chat.completions.create({
        model: 'openai/gpt-oss-120b', // Current Groq model
        messages: [{ role: 'user', content: prompt }],
        max_tokens: 1024,
      })
      return completion.choices[0]?.message?.content?.trim() || ''
    } catch (error: any) {
      if (error.status === 429 || error.message?.includes('rate limit')) {
        const delay = Math.pow(2, attempt) * 1000 // Exponential backoff: 1s, 2s, 4s
        console.log(`Rate limited, retrying in ${delay}ms...`)
        await new Promise(resolve => setTimeout(resolve, delay))
        attempt++
      } else {
        throw error
      }
    }
  }
  throw new Error('Max retries exceeded')
}