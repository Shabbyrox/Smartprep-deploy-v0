'use client'

import { useState, useEffect, useRef } from 'react'
import { Mic, MicOff, Play, Pause, Send, Loader2, CheckCircle } from 'lucide-react'
import { generateInterviewQuestion } from '@/app/interview/generate-interview-question'
import { evaluateAnswer } from '@/app/interview/evaluate-answer'
import { saveInterviewResult } from '@/app/interview/save-result'

interface ConversationTurn {
    question: string
    answer: string
    score?: number
    feedback?: string
}


const JOB_ROLES = [
    'Frontend Developer',
    'Backend Developer',
    'Full Stack Developer',
    'Data Scientist',
    'DevOps Engineer',
    'Product Manager',
    'UI/UX Designer',
]

const MAX_QUESTIONS = 5

export default function InterviewCard() {
    const [jobRole, setJobRole] = useState('')
    const [interviewStarted, setInterviewStarted] = useState(false)
    const [currentQuestion, setCurrentQuestion] = useState('')
    const [isRecording, setIsRecording] = useState(false)
    const [transcript, setTranscript] = useState('')
    const [isLoading, setIsLoading] = useState(false)
    const [conversationHistory, setConversationHistory] = useState<ConversationTurn[]>([])
    const [questionNumber, setQuestionNumber] = useState(1)
    const [interviewComplete, setInterviewComplete] = useState(false)
    const [isSpeaking, setIsSpeaking] = useState(false)

    const recognitionRef = useRef<any>(null)
    const synthRef = useRef<SpeechSynthesis | null>(null)

    useEffect(() => {
        if (typeof window !== 'undefined') {
            synthRef.current = window.speechSynthesis

            // Load voices
            const loadVoices = () => {
                const voices = synthRef.current?.getVoices() || []
                if (voices.length > 0) {
                    // Voices loaded
                }
            }
            loadVoices()
            if (synthRef.current.onvoiceschanged !== undefined) {
                synthRef.current.onvoiceschanged = loadVoices
            }

            // Initialize speech recognition
            const SpeechRecognition = (window as any).SpeechRecognition || (window as any).webkitSpeechRecognition
            if (SpeechRecognition) {
                try {
                    recognitionRef.current = new SpeechRecognition()
                    recognitionRef.current.continuous = true
                    recognitionRef.current.interimResults = true
                    recognitionRef.current.lang = 'en-US'

                    recognitionRef.current.onresult = (event: any) => {
                        let interimTranscript = ''
                        let finalTranscript = ''

                        for (let i = event.resultIndex; i < event.results.length; i++) {
                            const transcript = event.results[i][0].transcript
                            if (event.results[i].isFinal) {
                                finalTranscript += transcript + ' '
                            } else {
                                interimTranscript += transcript
                            }
                        }

                        setTranscript((prev) => prev + finalTranscript || interimTranscript)
                    }

                    // Remove onerror from here - set it only when starting
                } catch (error) {
                    console.error('Failed to initialize speech recognition:', error)
                    // Speech recognition not available or permission denied
                }
            }
        }

        return () => {
            if (recognitionRef.current) {
                recognitionRef.current.stop()
            }
        }
    }, [])

    const startInterview = async () => {
        if (!jobRole) return
        setIsLoading(true)
        setInterviewStarted(true)

        const result = await generateInterviewQuestion(jobRole, [], 1)
        if (result.error) {
            alert(result.error)
            setIsLoading(false)
            return
        }

        setCurrentQuestion(result.question!)
        speakText(result.question!)
        setIsLoading(false)
    }

    const getNaturalVoice = () => {
        if (!synthRef.current) return null
        const voices = synthRef.current.getVoices()
        // Prefer natural-sounding voices (Google, Microsoft, or female voices)
        const preferred = voices.find(v => 
            v.name.includes('Google') || 
            v.name.includes('Microsoft') || 
            v.name.includes('Female') || 
            v.name.includes('Samantha') || 
            v.name.includes('Zira')
        )
        return preferred || voices.find(v => v.lang.startsWith('en')) || voices[0]
    }

    const speakText = (text: string) => {
        if (synthRef.current) {
            synthRef.current.cancel()
            const utterance = new SpeechSynthesisUtterance(text)
            utterance.voice = getNaturalVoice()
            utterance.rate = 0.8 // Slower for more natural sound
            utterance.pitch = 1.1 // Slightly higher pitch for friendliness
            utterance.volume = 1
            utterance.onstart = () => setIsSpeaking(true)
            utterance.onend = () => setIsSpeaking(false)
            synthRef.current.speak(utterance)
        }
    }

    const toggleRecording = async () => {
        if (isRecording) {
            recognitionRef.current?.stop()
            setIsRecording(false)
        } else {
            setTranscript('')
            if (recognitionRef.current) {
                recognitionRef.current.onerror = (event: any) => {
                    console.error('Speech recognition error:', event.error)
                    setIsRecording(false)
                }
                try {
                    recognitionRef.current.start()
                    setIsRecording(true)
                } catch (error) {
                    console.error('Failed to start speech recognition:', error)
                    alert('Speech recognition failed to start. Please check your browser settings for microphone permissions.')
                }
            }
        }
    }

    const submitAnswer = async () => {
        if (!transcript.trim()) return

        setIsLoading(true)

        // Evaluate current answer
        const evaluation = await evaluateAnswer(currentQuestion, transcript, jobRole)

        const newTurn: ConversationTurn = {
            question: currentQuestion,
            answer: transcript,
            score: evaluation.score,
            feedback: evaluation.feedback
        }

        const updatedHistory = [...conversationHistory, newTurn]
        setConversationHistory(updatedHistory)

        if (questionNumber >= MAX_QUESTIONS) {
            setInterviewComplete(true)
            setIsLoading(false)
            return
        }

        // Generate next question
        const nextQuestionNum = questionNumber + 1
        const nextQuestion = await generateInterviewQuestion(jobRole, updatedHistory, nextQuestionNum)

        if (nextQuestion.error) {
            alert(nextQuestion.error)
            setIsLoading(false)
            return
        }

        setQuestionNumber(nextQuestionNum)
        setCurrentQuestion(nextQuestion.question!)
        setTranscript('')
        speakText(nextQuestion.question!)
        setIsLoading(false)
    }

    const restartInterview = () => {
        setJobRole('')
        setInterviewStarted(false)
        setCurrentQuestion('')
        setTranscript('')
        setConversationHistory([])
        setQuestionNumber(1)
        setInterviewComplete(false)
        if (synthRef.current) synthRef.current.cancel()
    }

    const getAverageScore = () => {
        if (conversationHistory.length === 0) return 0
        const total = conversationHistory.reduce((sum, turn) => sum + (turn.score || 0), 0)
        return Math.round(total / conversationHistory.length)
    }

    useEffect(() => {
        if (interviewComplete && jobRole && conversationHistory.length > 0) {
            const resultToSave = {
                jobRole,
                score: getAverageScore(),
                conversationHistory,
            };
            console.log('Attempting to save interview result...');
            saveInterviewResult(resultToSave).then(res => {
                if (res.error) {
                    console.error('Failed to save interview result:', res.error);
                } else {
                    console.log('Interview result saved successfully!');
                }
            });
        }
    }, [interviewComplete, jobRole, conversationHistory]);

    return (
        <div className="bg-white overflow-hidden shadow rounded-lg">
            <div className="p-6">
                {!interviewStarted && !interviewComplete && (
                    <>
                        <div className="flex items-center mb-6">
                            <div className="flex-shrink-0 bg-indigo-500 rounded-md p-3">
                                <Mic className="h-6 w-6 text-white" />
                            </div>
                            <div className="ml-4">
                                <h3 className="text-lg font-medium text-gray-900">AI Voice Interview</h3>
                                <p className="mt-1 text-sm text-gray-500">
                                    Practice interviews with AI. Select your role and start speaking!
                                </p>
                            </div>
                        </div>

                        <div className="space-y-4">
                            <div>
                                <label className="block text-sm font-medium text-gray-700 mb-2">
                                    Select Job Role
                                </label>
                                <select
                                    value={jobRole}
                                    onChange={(e) => setJobRole(e.target.value)}
                                    className="block w-full rounded-md text-gray-700 border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm p-2 border"
                                >
                                    <option value="">-- Select a role --</option>
                                    {JOB_ROLES.map((role) => (
                                        <option key={role} value={role}>
                                            {role}
                                        </option>
                                    ))}
                                </select>
                            </div>

                            <button
                                onClick={startInterview}
                                disabled={!jobRole || isLoading}
                                className={`w-full flex justify-center py-3 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white ${!jobRole || isLoading
                                        ? 'bg-gray-400 cursor-not-allowed'
                                        : 'bg-indigo-600 hover:bg-indigo-700'
                                    }`}
                            >
                                {isLoading ? (
                                    <>
                                        <Loader2 className="animate-spin -ml-1 mr-2 h-4 w-4" />
                                        Loading...
                                    </>
                                ) : (
                                    'Start Interview'
                                )}
                            </button>
                        </div>
                    </>
                )}

                {interviewStarted && !interviewComplete && (
                    <div className="space-y-6">
                        <div className="flex items-center justify-between border-b pb-4">
                            <div>
                                <h4 className="text-lg font-bold text-gray-900">{jobRole} Interview</h4>
                                <p className="text-sm text-gray-500">Question {questionNumber} of {MAX_QUESTIONS}</p>
                            </div>
                            {isSpeaking && (
                                <span className="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-100 text-blue-800">
                                    <Play className="h-3 w-3 mr-1" />
                                    AI Speaking
                                </span>
                            )}
                        </div>

                        <div className="bg-indigo-50 p-4 rounded-lg border border-indigo-200">
                            <p className="text-sm font-medium text-indigo-900 mb-2">Current Question:</p>
                            <p className="text-gray-800">{currentQuestion}</p>
                        </div>

                        <div className="space-y-4">
                            <div className="flex items-center justify-between">
                                <label className="text-sm font-medium text-gray-700">Your Answer:</label>
                                <button
                                    onClick={toggleRecording}
                                    className={`inline-flex items-center px-3 py-2 rounded-md text-sm font-medium ${isRecording
                                            ? 'bg-red-600 text-white hover:bg-red-700'
                                            : 'bg-green-600 text-white hover:bg-green-700'
                                        }`}
                                >
                                    {isRecording ? (
                                        <>
                                            <MicOff className="h-4 w-4 mr-1" />
                                            Stop Recording
                                        </>
                                    ) : (
                                        <>
                                            <Mic className="h-4 w-4 mr-1" />
                                            Start Recording
                                        </>
                                    )}
                                </button>
                            </div>

                            <textarea
                                value={transcript}
                                onChange={(e) => setTranscript(e.target.value)}
                                rows={5}
                                className="block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm p-2 border dark:bg-gray-800 dark:text-white dark:border-gray-600 dark:placeholder-gray-400"
                                placeholder={isRecording ? 'Listening...' : 'Click "Start Recording" to speak or type your answer here...'}
                            />

                            <button
                                onClick={submitAnswer}
                                disabled={!transcript.trim() || isLoading}
                                className={`w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white ${!transcript.trim() || isLoading
                                        ? 'bg-gray-400 cursor-not-allowed'
                                        : 'bg-indigo-600 hover:bg-indigo-700'
                                    }`}
                            >
                                {isLoading ? (
                                    <>
                                        <Loader2 className="animate-spin -ml-1 mr-2 h-4 w-4" />
                                        Processing...
                                    </>
                                ) : (
                                    <>
                                        <Send className="h-4 w-4 mr-2" />
                                        Submit Answer
                                    </>
                                )}
                            </button>
                        </div>
                    </div>
                )}

                {interviewComplete && (
                    <div className="space-y-6">
                        <div className="text-center border-b pb-4">
                            <h4 className="text-xl font-bold text-gray-900">Interview Complete!</h4>
                            <p className="text-sm text-gray-500 mt-1">Great job completing the interview</p>
                        </div>

                        <div className="flex justify-center">
                            <div className="text-center p-6 bg-indigo-50 rounded-lg border border-indigo-200">
                                <p className="text-sm font-medium text-indigo-900 mb-2">Average Score</p>
                                <div className="text-5xl font-extrabold text-indigo-600">{getAverageScore()}/10</div>
                            </div>
                        </div>

                        <div className="space-y-4">
                            <h5 className="font-bold text-gray-900">Interview Summary</h5>
                            {conversationHistory.map((turn, idx) => (
                                <div key={idx} className="bg-gray-50 p-4 rounded-lg border border-gray-200">
                                    <p className="text-sm font-medium text-gray-700 mb-1">Q{idx + 1}: {turn.question}</p>
                                    <p className="text-sm text-gray-600 mb-2">A: {turn.answer}</p>
                                    <div className="flex items-center justify-between">
                                        <span className="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-indigo-100 text-indigo-800">
                                            Score: {turn.score}/10
                                        </span>
                                        <p className="text-xs text-gray-500">{turn.feedback}</p>
                                    </div>
                                </div>
                            ))}
                        </div>

                        <button
                            onClick={restartInterview}
                            className="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700"
                        >
                            Start New Interview
                        </button>
                    </div>
                )}
            </div>
        </div>
    )
}
