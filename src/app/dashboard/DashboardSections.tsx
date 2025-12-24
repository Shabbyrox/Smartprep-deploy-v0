import { createClient } from '@/utils/supabase/server'
import { Trophy, Star, Activity, FileText, BrainCircuit, Clock } from 'lucide-react'
import DashboardChart from '@/components/DashboardChart'


// --- HELPER FUNCTIONS ---
const getWeekStartDate = (date: Date) => {
    const d = new Date(date)
    const day = d.getDay()
    const diff = d.getDate() - day + (day === 0 ? -6 : 1)
    return new Date(d.setDate(diff)).toISOString().split('T')[0]
}

async function getData(userId: string) {
    const supabase = await createClient()
    const twelveWeeksAgo = new Date()
    twelveWeeksAgo.setDate(twelveWeeksAgo.getDate() - 84)

    // Parallel Fetching
    const [quizzesRes, quizResultsRes, resumeRes, interviewRes] = await Promise.all([
        supabase.from('quizzes').select('*'),
        supabase.from('quiz_results').select('*').eq('user_id', userId).gte('created_at', twelveWeeksAgo.toISOString()),
        supabase.from('resume_analyses').select('overall_score,created_at').eq('user_id', userId).gte('created_at', twelveWeeksAgo.toISOString()),
        supabase.from('interview_results').select('score,created_at').eq('user_id', userId).gte('created_at', twelveWeeksAgo.toISOString())
    ])

    return {
        quizzes: quizzesRes.data || [],
        quizResults: quizResultsRes.data || [],
        resumeAnalyses: resumeRes.data || [],
        interviewResults: interviewRes.data || []
    }
}

// --- COMPONENT 1: STATS ---
export async function StatsSection({ userId }: { userId: string }) {
    const { quizzes, quizResults, resumeAnalyses, interviewResults } = await getData(userId)

    const uniqueQuizzesTaken = new Set(quizResults.map(r => r.quiz_id)).size
    const totalScore = quizResults.reduce((acc, r) => acc + (r.score || 0), 0)
    const totalPossible = quizResults.reduce((acc, r) => acc + (r.total_questions || 0), 0)
    const averageAccuracy = totalPossible > 0 ? Math.round((totalScore / totalPossible) * 100) : 0
    
    const sortedResumes = [...resumeAnalyses].sort((a,b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime())
    const latestResumeScore = sortedResumes.length > 0 ? sortedResumes[0].overall_score : 0
    
    const avgInterviewScore = interviewResults.length > 0
        ? Math.round(interviewResults.reduce((acc, r) => acc + (r.score || 0), 0) / interviewResults.length)
        : 0

    return (
        <div className="grid grid-cols-1 gap-5 sm:grid-cols-3 lg:grid-cols-5 mb-12">
            <StatCard icon={<Trophy className="h-6 w-6 text-yellow-400" />} label="Quizzes Completed" value={`${uniqueQuizzesTaken} / ${quizzes.length}`} />
            <StatCard icon={<Activity className="h-6 w-6 text-green-500" />} label="Avg. Accuracy" value={`${averageAccuracy}%`} />
            <StatCard icon={<Star className="h-6 w-6 text-indigo-500" />} label="Total Attempts" value={quizResults.length} />
            <StatCard icon={<FileText className="h-6 w-6 text-blue-500" />} label="Resume Score" value={`${latestResumeScore}%`} />
            <StatCard icon={<BrainCircuit className="h-6 w-6 text-purple-500" />} label="Avg. Interview" value={`${avgInterviewScore}/10`} />
        </div>
    )
}

// --- COMPONENT 2: CHARTS ---
export async function ChartsSection({ userId }: { userId: string }) {
    const { quizResults, resumeAnalyses, interviewResults } = await getData(userId)

    // Calculate Averages for Pie Chart
    const totalQScore = quizResults.reduce((acc, r) => acc + (r.score || 0), 0)
    const totalQPossible = quizResults.reduce((acc, r) => acc + (r.total_questions || 0), 0)
    const avgQuiz = totalQPossible > 0 ? Math.round((totalQScore / totalQPossible) * 100) : 0
    
    const sortedResumes = [...resumeAnalyses].sort((a,b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime())
    const latestResume = sortedResumes.length > 0 ? sortedResumes[0].overall_score : 0

    const avgInterview = interviewResults.length > 0
        ? Math.round(interviewResults.reduce((acc, r) => acc + (r.score || 0), 0) / interviewResults.length)
        : 0

    // Prepare Weekly Data
    const weeklyMap = new Map<string, { quiz: number[], interview: number[], resume: number[] }>()
    const addToMap = (dateStr: string, type: 'quiz' | 'interview' | 'resume', value: number) => {
        if(!dateStr) return 
        const week = getWeekStartDate(new Date(dateStr))
        if (!weeklyMap.has(week)) weeklyMap.set(week, { quiz: [], interview: [], resume: [] })
        weeklyMap.get(week)![type].push(value)
    }

    quizResults.forEach(r => { if(r.total_questions > 0) addToMap(r.created_at, 'quiz', (r.score / r.total_questions) * 100) })
    interviewResults.forEach(r => addToMap(r.created_at, 'interview', r.score * 10))
    resumeAnalyses.forEach(r => addToMap(r.created_at, 'resume', r.overall_score))

    const chartData = Array.from(weeklyMap.entries()).map(([week, scores]) => {
        const getAvg = (arr: number[]) => arr.length ? arr.reduce((a,b)=>a+b,0)/arr.length : null
        const validScores = [getAvg(scores.quiz), getAvg(scores.interview), getAvg(scores.resume)].filter(s => s !== null) as number[]
        return { name: week, score: validScores.length ? Math.round(validScores.reduce((a,b)=>a+b,0)/validScores.length) : 0 }
    }).sort((a,b) => new Date(a.name).getTime() - new Date(b.name).getTime())

    if (chartData.length === 0) {
        return (
             <div className="text-center p-8 bg-white shadow rounded-lg border border-gray-100 mb-12">
                <h3 className="text-lg font-medium text-gray-900">No activity yet</h3>
                <p className="mt-1 text-sm text-gray-500">Take a quiz or analyze your resume to generate your progress chart.</p>
            </div>
        )
    }

    return (
        <div className="mb-12">
            <DashboardChart 
                data={chartData} 
                quizScore={avgQuiz}
                resumeScore={latestResume}
                interviewScore={avgInterview}
            />
        </div>
    )
}

// --- COMPONENT 3: ROLE PROGRESS ---
export async function RoleProgressSection({ userId }: { userId: string }) {
    const { quizzes, quizResults } = await getData(userId)

    const roles = Array.from(new Set(quizzes.map(q => q.role).filter(Boolean)))
    
    const roleProgress = roles.map(role => {
        const roleQuizzes = quizzes.filter(q => q.role === role)
        const completedLevels = roleQuizzes.filter(q => {
            const attempts = quizResults.filter(r => r.quiz_id === q.id)
            if (!attempts.length) return false
            const passingScore = q.passing_score || 50
            return attempts.some(a => a.total_questions > 0 && (a.score / a.total_questions) * 100 >= passingScore)
        }).length

        return {
            role,
            completed: completedLevels,
            total: roleQuizzes.length,
            percentage: roleQuizzes.length > 0 ? Math.round((completedLevels / roleQuizzes.length) * 100) : 0
        }
    })

    if (roleProgress.length === 0) return <div className="text-center p-8 bg-white shadow rounded-lg"><p className="text-gray-500">No learning paths available yet.</p></div>

    return (
        <div className="bg-white shadow overflow-hidden sm:rounded-md">
            <ul className="divide-y divide-gray-200">
                {roleProgress.map((prog) => (
                    <li key={prog.role}>
                        <div className="px-4 py-4 sm:px-6">
                            <div className="flex items-center justify-between">
                                <div className="text-sm font-medium text-indigo-600 truncate capitalize">{prog.role}</div>
                                <div className="ml-2 flex-shrink-0 flex">
                                    <span className="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
                                        {prog.completed} / {prog.total} Levels
                                    </span>
                                </div>
                            </div>
                            <div className="mt-2">
                                <div className="w-full bg-gray-200 rounded-full h-2.5">
                                    <div className="bg-indigo-600 h-2.5 rounded-full" style={{ width: `${prog.percentage}%` }}></div>
                                </div>
                            </div>
                        </div>
                    </li>
                ))}
            </ul>
        </div>
    )
}

function StatCard({ icon, label, value }: { icon: React.ReactNode, label: string, value: string | number }) {
    return (
        <div className="bg-white overflow-hidden shadow rounded-lg">
            <div className="p-5">
                <div className="flex items-center">
                    <div className="flex-shrink-0">{icon}</div>
                    <div className="ml-5 w-0 flex-1">
                        <dl>
                            <dt className="text-sm font-medium text-gray-500 truncate">{label}</dt>
                            <dd className="text-lg font-medium text-gray-900">{value}</dd>
                        </dl>
                    </div>
                </div>
            </div>
        </div>
    )
}

// --- COMPONENT 4: RECENT ACTIVITY ---
export async function RecentActivitySection({ userId }: { userId: string }) {
    const supabase = await createClient()

    // Fetch from our new SQL View
    const { data: activities } = await supabase
        .from('user_activity_feed')
        .select('*')
        .eq('user_id', userId)
        .order('created_at', { ascending: false })
        .limit(5)

    if (!activities || activities.length === 0) {
        return null // Don't show anything if empty
    }

    return (
        <div className="bg-white shadow overflow-hidden sm:rounded-lg mb-8">
            <div className="px-4 py-5 sm:px-6 border-b border-gray-200">
                <h3 className="text-lg leading-6 font-medium text-gray-900 flex items-center gap-2">
                    <Clock className="h-5 w-5 text-gray-400" />
                    Recent Activity
                </h3>
            </div>
            <ul className="divide-y divide-gray-200">
                {activities.map((activity) => (
                    <li key={activity.id} className="px-4 py-4 sm:px-6 hover:bg-gray-50 transition-colors">
                        <div className="flex items-center justify-between">
                            <div className="flex items-center min-w-0 flex-1">
                                <div className="flex-shrink-0">
                                    {/* Icon based on type */}
                                    {activity.type === 'quiz' && <div className="h-10 w-10 rounded-full bg-indigo-100 flex items-center justify-center"><Trophy className="h-5 w-5 text-indigo-600" /></div>}
                                    {activity.type === 'resume' && <div className="h-10 w-10 rounded-full bg-blue-100 flex items-center justify-center"><FileText className="h-5 w-5 text-blue-600" /></div>}
                                    {activity.type === 'interview' && <div className="h-10 w-10 rounded-full bg-purple-100 flex items-center justify-center"><BrainCircuit className="h-5 w-5 text-purple-600" /></div>}
                                </div>
                                <div className="min-w-0 flex-1 px-4">
                                    <div>
                                        <p className="text-sm font-medium text-indigo-600 truncate">{activity.title}</p>
                                        <p className="mt-1 flex items-center text-sm text-gray-500">
                                            <span className="truncate">
                                                {new Date(activity.created_at).toLocaleDateString(undefined, { month: 'short', day: 'numeric' })}
                                            </span>
                                            <span className="mx-2">&middot;</span>
                                            <span className="capitalize">{activity.type}</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <span className={`inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ${
                                    (activity.score / activity.max_score) >= 0.7 ? 'bg-green-100 text-green-800' : 'bg-yellow-100 text-yellow-800'
                                }`}>
                                    {activity.type === 'quiz' ? `${Math.round((activity.score / activity.max_score) * 100)}%` : 
                                     activity.type === 'interview' ? `${activity.score}/10` : 
                                     `${activity.score}`}
                                </span>
                            </div>
                        </div>
                    </li>
                ))}
            </ul>
        </div>
    )
}