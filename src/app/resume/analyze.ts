'use server'

import { generateContentWithRetry } from '../../utils/gemini'
import { createClient } from '@/utils/supabase/server'

export async function analyzeResume(resumeContent: any) {
    const prompt = `
    Analyze the following resume data and provide constructive feedback with scores.
    
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
        "feedback": "Detailed markdown feedback focusing on strengths, weaknesses, and suggestions."
    }

    Resume Data:
    ${JSON.stringify(resumeContent, null, 2)}
  `

    try {
        const text = await generateContentWithRetry(prompt)

        // Robust JSON extraction
        const jsonMatch = text.match(/\{[\s\S]*\}/);
        const jsonStr = jsonMatch ? jsonMatch[0] : text;

        try {
            const result = JSON.parse(jsonStr)
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
            console.log('JSON parse failed, raw response:', jsonStr)
            return { error: 'AI returned invalid JSON. Please try again.' }
        }
    } catch (error: any) {
        console.error('Error analyzing resume:', error)
        return { error: error.message || 'Failed to analyze resume' }
    }
}
