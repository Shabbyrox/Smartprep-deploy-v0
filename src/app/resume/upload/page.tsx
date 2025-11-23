import ResumeAnalyzerCard from '@/components/ResumeAnalyzerCard'

export default function ResumeUploadPage() {
    return (
        <div className="min-h-screen bg-gray-50 py-12 px-4 sm:px-6 lg:px-8">
            <div className="max-w-3xl mx-auto">
                <h1 className="text-3xl font-bold text-gray-900 mb-8 text-center">Quick Resume Analysis</h1>
                <ResumeAnalyzerCard />
            </div>
        </div>
    )
}
