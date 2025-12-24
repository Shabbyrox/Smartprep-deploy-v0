import { createClient } from '@/utils/supabase/server'
import { redirect } from 'next/navigation'
import ProfileForm from '@/components/ProfileForm'

export default async function ProfilePage() {
    const supabase = await createClient()

    const { data: { user } } = await supabase.auth.getUser()

    if (!user) {
        redirect('/login')
    }

    // Fetch all new columns
    const { data: profile } = await supabase
        .from('profiles')
        .select(`
            full_name, 
            username, 
            website, 
            avatar_url,
            phone,
            location,
            target_role,
            preferred_industry,
            skills
        `)
        .eq('id', user.id)
        .single()

    return (
        <div className="min-h-screen bg-gray-50 py-12 px-4 sm:px-6 lg:px-8">
            <div className="max-w-3xl mx-auto">
                <h1 className="text-3xl font-bold text-gray-900 mb-8">Your Profile</h1>
                <ProfileForm user={user} profile={profile} />
            </div>
        </div>
    )
}