import { createClient } from '@/utils/supabase/server'
import Link from 'next/link'
import { redirect } from 'next/navigation'
import { Trophy, Star, Activity } from 'lucide-react'

export default async function Dashboard() {
    const supabase = await createClient()

    // Fetch data
    const { data: quizzes } = await supabase.from('quizzes').select('*')
    const { data: results } = await supabase.from('quiz_results').select('*')

    const { data: { user } } = await supabase.auth.getUser()

    if (!user) {
        redirect('/login')
    }

    const { data: profile } = await supabase
        .from('profiles')
        .select('*')
        .eq('id', user.id)
        .single()

    if (!quizzes || !results) {
        return <div>Loading...</div>
    }

    // Calculate Stats
    const totalQuizzesTaken = results.length
    const uniqueQuizzesTaken = new Set(results.map(r => r.quiz_id)).size
    const totalAvailableQuizzes = quizzes.length

    const totalScore = results.reduce((acc, r) => acc + r.score, 0)
    const totalPossibleScore = results.reduce((acc, r) => acc + r.total_questions, 0)
    const averageAccuracy = totalPossibleScore > 0 ? Math.round((totalScore / totalPossibleScore) * 100) : 0

    // Progress by Role
    const roles = Array.from(new Set(quizzes.map(q => q.role)))
    const roleProgress = roles.map(role => {
        const roleQuizzes = quizzes.filter(q => q.role === role)
        const roleResults = results.filter(r => roleQuizzes.some(q => q.id === r.quiz_id))

        // Count levels completed (passing score >= 70%)
        const completedLevels = roleQuizzes.filter(q => {
            const bestResult = roleResults
                .filter(r => r.quiz_id === q.id)
                .reduce((max, r) => (r.score > max.score ? r : max), { score: -1, total_questions: 1 } as any)

            return bestResult.score >= 0 && (bestResult.score / bestResult.total_questions) * 100 >= (q.passing_score || 50)
        }).length

        return {
            role,
            completed: completedLevels,
            total: roleQuizzes.length,
            percentage: Math.round((completedLevels / roleQuizzes.length) * 100)
        }
    })

    return (
        <div className="min-h-screen bg-gray-50 py-12 px-4 sm:px-6 lg:px-8">
            <div className="max-w-5xl mx-auto">
                <div className="mb-8">
                    <h1 className="text-3xl font-bold text-gray-900">
                        Welcome back, {profile?.full_name || user?.email?.split('@')[0]}!
                    </h1>
                    <p className="mt-2 text-gray-600">Here's how you're doing on your learning journey.</p>
                </div>

                {/* Stats Grid */}
                <div className="grid grid-cols-1 gap-5 sm:grid-cols-3 mb-12">
                    <div className="bg-white overflow-hidden shadow rounded-lg">
                        <div className="p-5">
                            <div className="flex items-center">
                                <div className="flex-shrink-0">
                                    <Trophy className="h-6 w-6 text-yellow-400" />
                                </div>
                                <div className="ml-5 w-0 flex-1">
                                    <dl>
                                        <dt className="text-sm font-medium text-gray-500 truncate">Quizzes Completed</dt>
                                        <dd className="text-lg font-medium text-gray-900">{uniqueQuizzesTaken} / {totalAvailableQuizzes}</dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="bg-white overflow-hidden shadow rounded-lg">
                        <div className="p-5">
                            <div className="flex items-center">
                                <div className="flex-shrink-0">
                                    <Activity className="h-6 w-6 text-green-500" />
                                </div>
                                <div className="ml-5 w-0 flex-1">
                                    <dl>
                                        <dt className="text-sm font-medium text-gray-500 truncate">Average Accuracy</dt>
                                        <dd className="text-lg font-medium text-gray-900">{averageAccuracy}%</dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="bg-white overflow-hidden shadow rounded-lg">
                        <div className="p-5">
                            <div className="flex items-center">
                                <div className="flex-shrink-0">
                                    <Star className="h-6 w-6 text-indigo-500" />
                                </div>
                                <div className="ml-5 w-0 flex-1">
                                    <dl>
                                        <dt className="text-sm font-medium text-gray-500 truncate">Total Attempts</dt>
                                        <dd className="text-lg font-medium text-gray-900">{totalQuizzesTaken}</dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                {/* Role Progress */}
                <h2 className="text-xl font-bold text-gray-900 mb-4">Role Progress</h2>
                <div className="bg-white shadow overflow-hidden sm:rounded-md">
                    <ul className="divide-y divide-gray-200">
                        {roleProgress.map((prog) => (
                            <li key={prog.role}>
                                <div className="px-4 py-4 sm:px-6">
                                    <div className="flex items-center justify-between">
                                        <div className="text-sm font-medium text-indigo-600 truncate">{prog.role}</div>
                                        <div className="ml-2 flex-shrink-0 flex">
                                            <span className="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
                                                {prog.completed} / {prog.total} Levels
                                            </span>
                                        </div>
                                    </div>
                                    <div className="mt-2">
                                        <div className="w-full bg-gray-200 rounded-full h-2.5">
                                            <div
                                                className="bg-indigo-600 h-2.5 rounded-full"
                                                style={{ width: `${prog.percentage}%` }}
                                            ></div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        ))}
                    </ul>
                </div>

                <div className="mt-8 flex justify-end">
                    <Link
                        href="/quiz"
                        className="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                    >
                        Go to Quizzes
                    </Link>
                </div>
            </div>
        </div>
    )
}
