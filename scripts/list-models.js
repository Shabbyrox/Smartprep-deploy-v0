const { GoogleGenerativeAI } = require('@google/generative-ai');
const fs = require('fs');
const path = require('path');

// Try to read .env.local manually since we can't rely on dotenv being installed/configured for this script
try {
    const envPath = path.resolve(process.cwd(), '.env.local');
    const envFile = fs.readFileSync(envPath, 'utf8');
    const match = envFile.match(/GEMINI_API_KEY=(.*)/);
    if (match && match[1]) {
        process.env.GEMINI_API_KEY = match[1].trim();
    }
} catch (e) {
    console.log('Could not read .env.local');
}

async function listModels() {
    const apiKey = process.env.GEMINI_API_KEY;
    if (!apiKey) {
        console.error('No API key found in .env.local');
        return;
    }

    const genAI = new GoogleGenerativeAI(apiKey);

    try {
        // Note: listModels might not be directly exposed on the client instance in older versions,
        // but let's try the standard way or fallback to a direct fetch if needed.
        // Actually, for the JS SDK, we might need to use the model manager if available, 
        // but the simplest way is often just to try a known model or use the REST API.
        // Let's use the REST API for certainty to avoid SDK version issues.

        const response = await fetch(`https://generativelanguage.googleapis.com/v1beta/models?key=${apiKey}`);
        const data = await response.json();

        if (data.models) {
            console.log('Available Models:');
            data.models.forEach(m => {
                if (m.supportedGenerationMethods && m.supportedGenerationMethods.includes('generateContent')) {
                    console.log(`- ${m.name} (${m.displayName})`);
                }
            });
        } else {
            console.log('No models found or error:', data);
        }
    } catch (error) {
        console.error('Error listing models:', error);
    }
}

listModels();
