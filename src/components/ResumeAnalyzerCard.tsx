'use client'

import { useState, useRef, useEffect } from 'react'
import { Upload, Loader2, FileText, Briefcase, ArrowRight } from 'lucide-react'
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
        if (score >= 80) return 'text-green-800 border-green-500 bg-green-100'
        if (score >= 60) return 'text-yellow-800 border-yellow-500 bg-yellow-100'
        return 'text-red-800 border-red-500 bg-red-100'
    }

    return (
        <div className="bg-white overflow-hidden shadow rounded-lg">
            <div className="p-6">
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
                                className="text-sm text-indigo-600 hover:text-indigo-500"
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
                                    <div key={key} className="bg-gray-50 p-2 rounded">
                                        <div className="flex justify-between items-center mb-1">
                                            <span className="text-xs font-medium text-gray-700 capitalize">{key.replace(/([A-Z])/g, ' $1').trim()}</span>
                                            <span className={`text-[10px] font-bold px-1.5 py-0.5 rounded border ${getScoreColor(score)}`}>{score}</span>
                                        </div>
                                        <div className="w-full bg-gray-200 rounded-full h-1">
                                            <div className={`h-1 rounded-full ${score >= 80 ? 'bg-green-500' : score >= 60 ? 'bg-yellow-500' : 'bg-red-500'}`} style={{ width: `${score}%` }}></div>
                                        </div>
                                    </div>
                                ))}
                            </div>
                        </div>

                        {/* Recommended Roles & Quiz Actions */}
                        {result.recommendedJobRoles && result.recommendedJobRoles.length > 0 && (
                            <div className="bg-white border border-gray-200 rounded-lg p-5 shadow-sm">
                                <div className="flex items-center gap-2 mb-4">
                                    <Briefcase className="h-5 w-5 text-indigo-600" />
                                    <h4 className="text-lg font-bold text-gray-900">Recommended Career Paths</h4>
                                </div>
                                <div className="grid gap-4 sm:grid-cols-1 md:grid-cols-3">
                                    {result.recommendedJobRoles.map((role: string, index: number) => (
                                        <div
                                            key={index}
                                            className={`relative flex flex-col justify-between p-4 rounded-lg border ${index === 0
                                                    ? 'bg-indigo-50 border-indigo-200 ring-1 ring-indigo-200'
                                                    : 'bg-gray-50 border-gray-200'
                                                }`}
                                        >
                                            {index === 0 && (
                                                <span className="absolute -top-2.5 left-1/2 transform -translate-x-1/2 bg-indigo-600 text-white text-[10px] font-bold px-2 py-0.5 rounded-full uppercase tracking-wide shadow-sm">
                                                    Top Match
                                                </span>
                                            )}
                                            <div className="mb-3 text-center">
                                                <h5 className={`font-bold ${index === 0 ? 'text-indigo-900 text-lg' : 'text-gray-800 text-base'}`}>
                                                    {role}
                                                </h5>
                                            </div>
                                            <Link
                                                href={`/quiz?role=${encodeURIComponent(role)}`}
                                                className={`w-full inline-flex items-center justify-center px-3 py-1.5 text-xs font-medium rounded-md transition-colors ${index === 0
                                                        ? 'bg-indigo-600 text-white hover:bg-indigo-700 shadow-sm'
                                                        : 'bg-white text-gray-700 border border-gray-300 hover:bg-gray-50'
                                                    }`}
                                            >
                                                Take Quiz
                                                <ArrowRight className="ml-1.5 h-3 w-3" />
                                            </Link>
                                        </div>
                                    ))}
                                </div>
                            </div>
                        )}

                        <div className="bg-gray-50 p-6 rounded-lg border border-gray-200 prose prose-sm max-w-none text-gray-800 prose-headings:text-gray-900 prose-headings:font-bold prose-p:text-gray-800 prose-strong:text-indigo-700 prose-ul:list-none prose-ul:pl-0 prose-li:mb-2">
                            <ReactMarkdown>{result.feedback}</ReactMarkdown>
                        </div>
                    </div>
                )}
            </div>
        </div>
    )
}
