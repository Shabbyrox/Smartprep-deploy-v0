'use client'

import { useState, useRef } from 'react'
import { useReactToPrint } from 'react-to-print'
import { ResumeData, initialResumeData } from '@/types/resume'
import ResumeForm from '@/components/ResumeForm'
import { ResumePreview } from '@/components/ResumePreview'
import { Download, Save } from 'lucide-react'
import { analyzeResume } from './analyze'
import ReactMarkdown from 'react-markdown'

export default function ResumeBuilder() {
    const [data, setData] = useState<ResumeData>(initialResumeData)
    const [analyzing, setAnalyzing] = useState(false)
    const [analysisResult, setAnalysisResult] = useState<any>(null)
    const componentRef = useRef<HTMLDivElement>(null)

    const handlePrint = useReactToPrint({
        contentRef: componentRef,
        documentTitle: `${data.personalInfo.fullName}_Resume`,
    })

    const handleAnalyze = async () => {
        setAnalyzing(true)
        setAnalysisResult(null)
        const result = await analyzeResume(data)
        if (result.error) {
            alert(result.error)
        } else {
            setAnalysisResult(result)
        }
        setAnalyzing(false)
    }

    const getScoreColor = (score: number) => {
        if (score >= 80) return 'text-green-800 border-green-500 bg-green-100'
        if (score >= 60) return 'text-yellow-800 border-yellow-500 bg-yellow-100'
        return 'text-red-800 border-red-500 bg-red-100'
    }

    return (
        <div className="min-h-screen bg-gray-100">
            {/* Top Bar */}
            <header className="bg-white shadow sticky top-0 z-10">
                <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4 flex justify-between items-center">
                    <h1 className="text-2xl font-bold text-gray-900">Resume Builder</h1>
                    <div className="flex gap-4">
                        <button
                            onClick={handleAnalyze}
                            disabled={analyzing}
                            className="inline-flex items-center px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 disabled:opacity-50"
                        >
                            {analyzing ? 'Analyzing...' : 'Analyze with AI'}
                        </button>
                        <button
                            onClick={() => handlePrint()}
                            className="inline-flex items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                        >
                            <Download className="h-4 w-4 mr-2" />
                            Download PDF
                        </button>
                    </div>
                </div>
            </header>

            <main className="max-w-[1920px] mx-auto px-4 sm:px-6 lg:px-8 py-8">
                <div className="flex flex-col lg:flex-row gap-8">
                    {/* Left Side: Form */}
                    <div className="w-full lg:w-1/2 xl:w-2/5 h-[calc(100vh-100px)] overflow-y-auto pr-2">
                        <ResumeForm data={data} onChange={setData} />

                        {/* AI Feedback Area */}
                        {analysisResult && (
                            <div className="mt-8 bg-white p-6 rounded-lg shadow space-y-6">
                                {/* Overall Score */}
                                <div className="text-center border-b pb-6">
                                    <h3 className="text-lg font-bold text-gray-900 mb-2">Overall Score</h3>
                                    <div className={`inline-flex items-center justify-center w-24 h-24 rounded-full border-4 text-4xl font-extrabold ${getScoreColor(analysisResult.overallScore)}`}>
                                        {analysisResult.overallScore}
                                    </div>
                                </div>

                                {/* Section Scores */}
                                <div>
                                    <h4 className="font-semibold text-gray-900 mb-3">Section Breakdown</h4>
                                    <div className="grid grid-cols-2 gap-4">
                                        {Object.entries(analysisResult.sectionScores || {}).map(([key, score]: [string, any]) => (
                                            <div key={key} className="bg-gray-50 p-3 rounded-lg">
                                                <div className="flex justify-between items-center mb-1">
                                                    <span className="text-sm font-medium text-gray-700 capitalize">{key.replace(/([A-Z])/g, ' $1').trim()}</span>
                                                    <span className={`text-xs font-extrabold px-2 py-1 rounded border ${getScoreColor(score)}`}>{score}/100</span>
                                                </div>
                                                <div className="w-full bg-gray-200 rounded-full h-1.5">
                                                    <div className={`h-1.5 rounded-full ${score >= 80 ? 'bg-green-500' : score >= 60 ? 'bg-yellow-500' : 'bg-red-500'}`} style={{ width: `${score}%` }}></div>
                                                </div>
                                            </div>
                                        ))}
                                    </div>
                                </div>

                                {/* Detailed Feedback */}
                                <div>
                                    <h4 className="font-semibold text-gray-900 mb-3">Detailed Feedback</h4>
                                    <div className="prose prose-sm max-w-none text-gray-700 bg-gray-50 p-4 rounded-lg">
                                        <ReactMarkdown>{analysisResult.feedback}</ReactMarkdown>
                                    </div>
                                </div>
                            </div>
                        )}
                    </div>

                    {/* Right Side: Preview */}
                    <div className="w-full lg:w-1/2 xl:w-3/5 bg-gray-200 p-8 rounded-lg flex justify-center items-start overflow-y-auto h-[calc(100vh-100px)]">
                        <div className="transform scale-90 origin-top">
                            <ResumePreview ref={componentRef} data={data} />
                        </div>
                    </div>
                </div>
            </main>
        </div>
    )
}
