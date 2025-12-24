'use client'

import dynamic from 'next/dynamic'

// Dynamically import both charts to avoid Server-Side Rendering issues with Recharts
const OverallScoreChart = dynamic(() => import('@/components/OverallScoreChart'), { ssr: false })
const ScoresPieChart = dynamic(() => import('@/components/ScoresPieChart'), { ssr: false })

interface WeeklyScore {
    name: string;
    score: number;
}

interface DashboardChartProps {
    data: WeeklyScore[];
    quizScore: number;
    resumeScore: number;
    interviewScore: number;
}

export default function DashboardChart({ data, quizScore, resumeScore, interviewScore }: DashboardChartProps) {
    return (
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
            {/* Left Side: Weekly History (Takes up 2/3 of space on large screens) */}
            <div className="lg:col-span-2">
                <OverallScoreChart data={data} />
            </div>

            {/* Right Side: Pie Chart (Takes up 1/3 of space) */}
            <div className="lg:col-span-1">
                <ScoresPieChart 
                    quizScore={quizScore} 
                    resumeScore={resumeScore} 
                    interviewScore={interviewScore} 
                />
            </div>
        </div>
    )
}