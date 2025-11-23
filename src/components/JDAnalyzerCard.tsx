'use client'

import { useState } from 'react'
import { Upload, Loader2, FileText, Briefcase, CheckCircle, AlertCircle } from 'lucide-react'
import { analyzeResumeWithJD } from '@/app/resume/analyze-jd'
import ReactMarkdown from 'react-markdown'

export default function JDAnalyzerCard() {
    const [analyzing, setAnalyzing] = useState(false)
    const [result, setResult] = useState<any>(null)
    const [jobRole, setJobRole] = useState('')
    const [jobDescription, setJobDescription] = useState('')
    const [file, setFile] = useState<File | null>(null)

    const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        if (e.target.files && e.target.files.length > 0) {
            setFile(e.target.files[0])
        }
    }

    const handleAnalyze = async () => {
        if (!file || !jobRole || !jobDescription) return

        setAnalyzing(true)
        setResult(null)

        const formData = new FormData()
        formData.append('file', file)
        formData.append('jobRole', jobRole)
        formData.append('jobDescription', jobDescription)

        const response = await analyzeResumeWithJD(formData)

        if (response.error) {
            alert(response.error)
        } else {
            setResult(response)
        }
        setAnalyzing(false)
    }

    const getScoreColor = (score: number) => {
        if (score >= 80) return 'text-green-600 bg-green-100 border-green-200'
        if (score >= 60) return 'text-yellow-600 bg-yellow-100 border-yellow-200'
        return 'text-red-600 bg-red-100 border-red-200'
    }

    return (
        <div className="bg-white overflow-hidden shadow rounded-lg">
            <div className="p-6">
                <div className="flex items-center mb-6">
                    <div className="flex-shrink-0 bg-blue-500 rounded-md p-3">
                        <Briefcase className="h-6 w-6 text-white" />
                    </div>
                    <div className="ml-4">
                        <h3 className="text-lg font-medium text-gray-900">Job Description Analysis</h3>
                        <p className="mt-1 text-sm text-gray-500">
                            Tailor your resume for a specific role. Upload your resume and paste the Job Description.
                        </p>
                    </div>
                </div>

                {!result && (
                    <div className="space-y-6">
                        <div>
                            <label htmlFor="job-role" className="block text-sm font-medium text-gray-700">
                                Job Role / Title
                            </label>
                            <input
                                type="text"
                                id="job-role"
                                className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm p-2 border"
                                placeholder="e.g. Senior Frontend Engineer"
                                value={jobRole}
                                onChange={(e) => setJobRole(e.target.value)}
                            />
                        </div>

                        <div>
                            <label htmlFor="job-description" className="block text-sm font-medium text-gray-700">
                                Job Description (JD)
                            </label>
                            <textarea
                                id="job-description"
                                rows={6}
                                className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm p-2 border"
                                placeholder="Paste the full job description here..."
                                value={jobDescription}
                                onChange={(e) => setJobDescription(e.target.value)}
                            />
                        </div>

                        <div>
                            <label className="block text-sm font-medium text-gray-700 mb-2">Upload Resume (PDF)</label>
                            <div className="flex justify-center px-6 pt-5 pb-6 border-2 border-gray-300 border-dashed rounded-md hover:border-indigo-500 transition-colors">
                                <div className="space-y-1 text-center">
                                    <FileText className="mx-auto h-12 w-12 text-gray-400" />
                                    <div className="flex text-sm text-gray-600 justify-center">
                                        <label
                                            htmlFor="file-upload"
                                            className="relative cursor-pointer bg-white rounded-md font-medium text-indigo-600 hover:text-indigo-500 focus-within:outline-none focus-within:ring-2 focus-within:ring-offset-2 focus-within:ring-indigo-500"
                                        >
                                            <span>{file ? file.name : 'Upload a file'}</span>
                                            <input id="file-upload" name="file-upload" type="file" className="sr-only" accept=".pdf" onChange={handleFileChange} />
                                        </label>
                                    </div>
                                    <p className="text-xs text-gray-500">PDF up to 10MB</p>
                                </div>
                            </div>
                        </div>

                        <button
                            onClick={handleAnalyze}
                            disabled={!file || !jobRole || !jobDescription || analyzing}
                            className={`w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white ${!file || !jobRole || !jobDescription || analyzing
                                ? 'bg-gray-400 cursor-not-allowed'
                                : 'bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500'
                                }`}
                        >
                            {analyzing ? (
                                <>
                                    <Loader2 className="animate-spin -ml-1 mr-2 h-4 w-4" />
                                    Analyzing Fit...
                                </>
                            ) : (
                                'Analyze Match'
                            )}
                        </button>
                    </div>
                )}

                {result && (
                    <div className="mt-6 space-y-6 animate-in fade-in slide-in-from-bottom-4 duration-500">
                        <div className="flex items-center justify-between border-b pb-4">
                            <h4 className="text-xl font-bold text-gray-900">Match Analysis</h4>
                            <button
                                onClick={() => setResult(null)}
                                className="text-sm text-indigo-600 hover:text-indigo-500"
                            >
                                Analyze Another
                            </button>
                        </div>

                        <div className="flex flex-col md:flex-row gap-8 items-start">
                            {/* Score Card */}
                            <div className="w-full md:w-1/3 flex flex-col items-center p-4 bg-gray-50 rounded-lg border border-gray-200">
                                <h3 className="text-lg font-bold text-gray-900 mb-4">Match Score</h3>
                                <div className={`flex items-center justify-center w-32 h-32 rounded-full border-8 text-4xl font-extrabold ${getScoreColor(result.matchScore)}`}>
                                    {result.matchScore}%
                                </div>
                                <p className="mt-4 text-sm text-center text-gray-500">
                                    {result.matchScore >= 80 ? 'Great Match! 🚀' : result.matchScore >= 60 ? 'Good Potential 👍' : 'Needs Work 🛠️'}
                                </p>
                            </div>

                            {/* Missing Keywords */}
                            <div className="w-full md:w-2/3">
                                <h4 className="text-md font-bold text-gray-900 mb-3 flex items-center">
                                    <AlertCircle className="h-5 w-5 text-orange-500 mr-2" />
                                    Missing Keywords / Skills
                                </h4>
                                {result.missingKeywords && result.missingKeywords.length > 0 ? (
                                    <div className="flex flex-wrap gap-2">
                                        {result.missingKeywords.map((keyword: string, idx: number) => (
                                            <span key={idx} className="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-red-100 text-red-800">
                                                {keyword}
                                            </span>
                                        ))}
                                    </div>
                                ) : (
                                    <p className="text-sm text-green-600 flex items-center">
                                        <CheckCircle className="h-4 w-4 mr-1" /> No major keywords missing!
                                    </p>
                                )}

                                <div className="mt-6">
                                    <h4 className="text-md font-bold text-gray-900 mb-3">Detailed Feedback</h4>
                                    <div className="bg-gray-50 p-4 rounded-lg border border-gray-200 prose prose-sm max-w-none text-gray-800">
                                        <ReactMarkdown>{result.feedback}</ReactMarkdown>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                )}
            </div>
        </div>
    )
}
