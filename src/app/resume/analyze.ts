// src/app/resume/analyze.ts
'use server'

import { generateContentWithRetry } from '../../utils/gemini'
import { createClient } from '@/utils/supabase/server'

export async function analyzeResume(resumeContent: any) {
    const prompt = `
    You are an expert Resume Reviewer. Analyze the following resume data and provide constructive feedback with scores.
    
    CRITICAL INSTRUCTION: Respond ONLY with a raw JSON object. 
    - Do NOT wrap the output in markdown code blocks (like \`\`\`json).
    - Do NOT include any introductory text.
    - Ensure the JSON is valid and parsable.
    
    Structure:
    {
        "overallScore": number (0-100),
        "sectionScores": {
            "personalInfo": number (0-100),
            "education": number (0-100),
            "projects": number (0-100),
            "skills": number (0-100),
            "achievements": number (0-100),
            "co-curricular": number (0-100)
        },
        "feedback": "Detailed markdown feedback focusing on strengths, weaknesses, and suggestions."
    }

    Resume Data:
    ${JSON.stringify(resumeContent, null, 2)}
  `

    try {
        const text = await generateContentWithRetry(prompt)

        // 1. Clean the response: Remove Markdown code blocks if present
        let cleanText = text.replace(/```json/g, '').replace(/```/g, '').trim();

        // 2. Find the first '{' and last '}' to isolate the JSON object
        const firstOpen = cleanText.indexOf('{');
        const lastClose = cleanText.lastIndexOf('}');

        if (firstOpen !== -1 && lastClose !== -1) {
            cleanText = cleanText.substring(firstOpen, lastClose + 1);
        }

        try {
            const result = JSON.parse(cleanText)
            
            // Save to database
            const supabase = await createClient()
            const { data: { user } } = await supabase.auth.getUser()
            
            if (user) {
                await supabase.from('resume_analyses').insert({
                    user_id: user.id,
                    overall_score: result.overallScore,
                    section_scores: result.sectionScores,
                    feedback: result.feedback,
                    source: 'quick_analysis',
                    created_at: new Date().toISOString()
                })
            }
            return result

        } catch (e) {
            console.error('JSON Parsing Failed. Raw Text from AI:', text)
            return { error: 'AI returned invalid JSON. Please try again.' }
        }
    } catch (error: any) {
        console.error('Error analyzing resume:', error)
        return { error: error.message || 'Failed to analyze resume' }
    }
}