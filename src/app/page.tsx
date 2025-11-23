import { createClient } from '@/utils/supabase/server'
import { redirect } from 'next/navigation'
import { signOut } from '@/app/actions'
import Link from 'next/link'
import { FileText, Brain, Mic } from 'lucide-react'

export default async function Home() {
    const supabase = await createClient()

    const {
        data: { user },
    } = await supabase.auth.getUser()

    if (!user) {
        redirect('/login')
    }

    return (
        <div className="min-h-screen bg-gray-50 py-12 px-4 sm:px-6 lg:px-8">
            <div className="max-w-4xl mx-auto">
                <div className="flex justify-between items-center mb-8">
                    <h1 className="text-3xl font-bold text-gray-900">Student Platform</h1>
                </div>

                <div className="grid md:grid-cols-2 gap-6">
                    {/* Resume Builder Card */}
                    <div className="bg-white overflow-hidden shadow rounded-lg">
                        <div className="p-6">
                            <div className="flex items-center">
                                <div className="flex-shrink-0 bg-indigo-500 rounded-md p-3">
                                    <FileText className="h-6 w-6 text-white" />
                                </div>
                                <div className="ml-4">
                                    <h3 className="text-lg font-medium text-gray-900">Resume Builder</h3>
                                    <p className="mt-1 text-sm text-gray-500">
                                        Create and analyze your professional resume with AI.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div className="bg-gray-50 px-6 py-4">
                            <Link
                                href="/resume"
                                className="text-sm font-medium text-indigo-600 hover:text-indigo-500"
                            >
                                Go to Builder <span aria-hidden="true">&rarr;</span>
                            </Link>
                        </div>
                    </div>

                    {/* Quiz System Card */}
                    <div className="bg-white overflow-hidden shadow rounded-lg">
                        <div className="p-6">
                            <div className="flex items-center">
                                <div className="flex-shrink-0 bg-green-500 rounded-md p-3">
                                    <Brain className="h-6 w-6 text-white" />
                                </div>
                                <div className="ml-4">
                                    <h3 className="text-lg font-medium text-gray-900">Skill Quizzes</h3>
                                    <p className="mt-1 text-sm text-gray-500">
                                        Test your knowledge and earn badges.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div className="bg-gray-50 px-6 py-4">
                            <Link
                                href="/quiz"
                                className="text-sm font-medium text-indigo-600 hover:text-indigo-500"
                            >
                                Start Quiz <span aria-hidden="true">&rarr;</span>
                            </Link>
                        </div>
                    </div>

                    {/* Quick Analysis Card */}
                    <div className="bg-white overflow-hidden shadow rounded-lg">
                        <div className="p-6">
                            <div className="flex items-center">
                                <div className="flex-shrink-0 bg-purple-500 rounded-md p-3">
                                    <FileText className="h-6 w-6 text-white" />
                                </div>
                                <div className="ml-4">
                                    <h3 className="text-lg font-medium text-gray-900">Quick Analysis</h3>
                                    <p className="mt-1 text-sm text-gray-500">
                                        Upload an existing PDF resume for instant AI feedback.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div className="bg-gray-50 px-6 py-4">
                            <Link
                                href="/resume/upload"
                                className="text-sm font-medium text-indigo-600 hover:text-indigo-500"
                            >
                                Analyze PDF <span aria-hidden="true">&rarr;</span>
                            </Link>
                        </div>
                    </div>

                    {/* JD Analysis Card */}
                    <div className="bg-white overflow-hidden shadow rounded-lg">
                        <div className="p-6">
                            <div className="flex items-center">
                                <div className="flex-shrink-0 bg-blue-500 rounded-md p-3">
                                    <Brain className="h-6 w-6 text-white" />
                                </div>
                                <div className="ml-4">
                                    <h3 className="text-lg font-medium text-gray-900">JD Match Analysis</h3>
                                    <p className="mt-1 text-sm text-gray-500">
                                        Tailor your resume for a specific job role and description.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div className="bg-gray-50 px-6 py-4">
                            <Link
                                href="/resume/jd-analysis"
                                className="text-sm font-medium text-indigo-600 hover:text-indigo-500"
                            >
                                Check Match <span aria-hidden="true">&rarr;</span>
                            </Link>
                        </div>
                    </div>

                    {/* AI Interview Card */}
                    <div className="bg-white overflow-hidden shadow rounded-lg">
                        <div className="p-6">
                            <div className="flex items-center">
                                <div className="flex-shrink-0 bg-indigo-500 rounded-md p-3">
                                    <Mic className="h-6 w-6 text-white" />
                                </div>
                                <div className="ml-4">
                                    <h3 className="text-lg font-medium text-gray-900">AI Interview</h3>
                                    <p className="mt-1 text-sm text-gray-500">
                                        Practice voice interviews with AI for your dream role.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div className="bg-gray-50 px-6 py-4">
                            <Link
                                href="/interview"
                                className="text-sm font-medium text-indigo-600 hover:text-indigo-500"
                            >
                                Start Interview <span aria-hidden="true">&rarr;</span>
                            </Link>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}
