'use client'

import { useState, useRef, useEffect } from 'react'
import { Upload, Loader2, FileText, Briefcase, ArrowRight, ArrowLeft, ChevronRight, CheckCircle2, AlertCircle, Sparkles, Lightbulb } from 'lucide-react'
import { analyzePdfResume } from '@/app/resume/analyze-pdf'
import ReactMarkdown from 'react-markdown'
import Link from 'next/link'

export default function ResumeAnalyzerCard() {
    const [analyzing, setAnalyzing] = useState(false)
    const [result, setResult] = useState<any>(null)
    const resultsRef = useRef<HTMLDivElement>(null)

    useEffect(() => {
        if (result && resultsRef.current) {
            resultsRef.current.scrollIntoView({ behavior: 'smooth', block: 'start' })
        }
    }, [result])

    const handleFileUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
        if (!e.target.files || e.target.files.length === 0) return

        const file = e.target.files[0]
        const formData = new FormData()
        formData.append('file', file)

        setAnalyzing(true)
        setResult(null)

        const response = await analyzePdfResume(formData)

        if (response.error) {
            alert(response.error)
        } else {
            setResult(response)
        }
        setAnalyzing(false)
    }

    const getScoreColor = (score: number) => {
        if (score >= 80) return 'text-emerald-600 border-emerald-500 bg-emerald-50'
        if (score >= 60) return 'text-amber-600 border-amber-500 bg-amber-50'
        return 'text-rose-600 border-rose-500 bg-rose-50'
    }

    const getProgressColor = (score: number) => {
        if (score >= 80) return 'bg-emerald-500'
        if (score >= 60) return 'bg-amber-500'
        return 'bg-rose-500'
    }

    return (
        <div className="bg-white overflow-hidden shadow rounded-lg border border-slate-200">
            <div className="p-6">
                <Link href="/resume" className="inline-flex items-center text-sm text-slate-500 hover:text-indigo-600 transition-colors mb-6 group">
                    <ArrowLeft className="h-4 w-4 mr-2 group-hover:-translate-x-1 transition-transform" />
                    Back to Resume Tools
                </Link>

                <div className="flex items-center mb-4">
                    <div className="flex-shrink-0 bg-purple-500 rounded-md p-3">
                        <Upload className="h-6 w-6 text-white" />
                    </div>
                    <div className="ml-4">
                        <h3 className="text-lg font-medium text-gray-900">Quick Resume Analysis</h3>
                        <p className="mt-1 text-sm text-gray-500">
                            Upload your existing resume (PDF) for instant AI scoring and feedback.
                        </p>
                    </div>
                </div>

                {!result && (
                    <div className="mt-4 flex justify-center px-6 pt-5 pb-6 border-2 border-gray-300 border-dashed rounded-md hover:border-indigo-500 transition-colors">
                        {analyzing ? (
                            <div className="text-center py-8">
                                <Loader2 className="mx-auto h-12 w-12 text-indigo-500 animate-spin" />
                                <p className="mt-2 text-sm text-gray-600">Analyzing your resume...</p>
                            </div>
                        ) : (
                            <div className="space-y-1 text-center">
                                <FileText className="mx-auto h-12 w-12 text-gray-400" />
                                <div className="flex text-sm text-gray-600 justify-center">
                                    <label
                                        htmlFor="file-upload"
                                        className="relative cursor-pointer bg-white rounded-md font-medium text-indigo-600 hover:text-indigo-500 focus-within:outline-none focus-within:ring-2 focus-within:ring-offset-2 focus-within:ring-indigo-500"
                                    >
                                        <span>Upload a file</span>
                                        <input id="file-upload" name="file-upload" type="file" className="sr-only" accept=".pdf" onChange={handleFileUpload} />
                                    </label>
                                    <p className="pl-1">or drag and drop</p>
                                </div>
                                <p className="text-xs text-gray-500">PDF up to 10MB</p>
                            </div>
                        )}
                    </div>
                )}

                {result && (
                    <div ref={resultsRef} className="mt-6 space-y-6 animate-in fade-in slide-in-from-bottom-4 duration-500">
                        <div className="flex items-center justify-between border-b pb-4">
                            <h4 className="text-xl font-bold text-gray-900">Analysis Result</h4>
                            <button
                                onClick={() => setResult(null)}
                                className="text-sm text-indigo-600 hover:text-indigo-500 font-medium"
                            >
                                Analyze Another
                            </button>
                        </div>

                        <div className="flex flex-col md:flex-row gap-6 items-center justify-center">
                            <div className="text-center">
                                <h3 className="text-lg font-bold text-gray-900 mb-2">Overall Score</h3>
                                <div className={`inline-flex items-center justify-center w-32 h-32 rounded-full border-8 text-5xl font-extrabold ${getScoreColor(result.overallScore)}`}>
                                    {result.overallScore}
                                </div>
                            </div>

                            <div className="flex-1 w-full grid grid-cols-2 gap-3">
                                {Object.entries(result.sectionScores || {}).map(([key, score]: [string, any]) => (
                                    <div key={key} className="bg-slate-50 p-2 rounded border border-slate-100">
                                        <div className="flex justify-between items-center mb-1">
                                            <span className="text-xs font-medium text-slate-700 capitalize">{key.replace(/([A-Z])/g, ' $1').trim()}</span>
                                            <span className={`text-[10px] font-bold px-1.5 py-0.5 rounded border ${getScoreColor(score)}`}>{score}</span>
                                        </div>
                                        <div className="w-full bg-slate-200 rounded-full h-1">
                                            <div className={`h-1 rounded-full transition-all duration-1000 ${getProgressColor(score)}`} style={{ width: `${score}%` }}></div>
                                        </div>
                                    </div>
                                ))}
                            </div>
                        </div>

                        {/* Detailed Feedback Section - IMPROVED UI */}
                        <div className="mt-8">
                            <h4 className="text-lg font-bold text-slate-900 mb-6 flex items-center gap-2">
                                <Sparkles className="h-5 w-5 text-indigo-500" />
                                AI Insights & Recommendations
                            </h4>
                            
                            <div className="bg-slate-50/50 rounded-xl text-slate-900  border border-slate-200 overflow-hidden p-6">
                                <ReactMarkdown
                                    components={{
                                        // 1. Headers act as Section Dividers
                                        h3: ({node, ...props}) => (
                                            <div className="mt-8 first:mt-0 mb-4 pb-2 border-b border-indigo-100 flex items-center gap-2">
                                                <div className="bg-indigo-100 p-1.5 rounded-md">
                                                    <Lightbulb className="h-4 w-4 text-indigo-600" />
                                                </div>
                                                <h3 className="text-base font-bold text-indigo-900 uppercase tracking-wide" {...props} />
                                            </div>
                                        ),
                                        // 2. Paragraphs
                                        p: ({node, ...props}) => (
                                            <p className="mb-4 text-slate-600 leading-relaxed text-sm" {...props} />
                                        ),
                                        // 3. Lists -> Grid of Insight Cards
                                        ul: ({node, ...props}) => (
                                            <ul className="grid grid-cols-1 gap-3 mb-6" {...props} />
                                        ),
                                        // 4. List Items -> Individual Cards
                                        li: ({node, ...props}) => (
                                            <li className="bg-white p-3.5 rounded-lg border border-slate-200 shadow-sm flex items-start gap-3 hover:border-indigo-300 transition-colors">
                                                <div className="mt-0.5 min-w-5">
                                                    <CheckCircle2 className="h-5 w-5 text-emerald-500" />
                                                </div>
                                                <span className="text-sm text-slate-700 leading-relaxed">{props.children}</span>
                                            </li>
                                        ),
                                        // 5. Bold text -> Highlighter effect
                                        strong: ({node, ...props}) => (
                                            <strong className="font-semibold text-indigo-800 bg-indigo-50 px-1 py-0.5 rounded" {...props} />
                                        )
                                    }}
                                >
                                    {result.feedback}
                                </ReactMarkdown>
                            </div>
                        </div>
                    </div>
                )}
            </div>
        </div>
    )
}