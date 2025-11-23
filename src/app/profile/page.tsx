'use client'

import { createClient } from '@/utils/supabase/client'
import { useEffect, useState } from 'react'
import { useRouter } from 'next/navigation'

export default function ProfilePage() {
    const [loading, setLoading] = useState(true)
    const [fullname, setFullname] = useState<string | null>(null)
    const [username, setUsername] = useState<string | null>(null)
    const [website, setWebsite] = useState<string | null>(null)
    const [avatarUrl, setAvatarUrl] = useState<string | null>(null)
    const [user, setUser] = useState<any>(null)
    const router = useRouter()
    const supabase = createClient()

    useEffect(() => {
        const getProfile = async () => {
            try {
                setLoading(true)
                const { data: { user } } = await supabase.auth.getUser()

                if (!user) {
                    router.push('/login')
                    return
                }

                setUser(user)

                const { data, error, status } = await supabase
                    .from('profiles')
                    .select(`full_name, username, website, avatar_url`)
                    .eq('id', user.id)
                    .single()

                if (error && status !== 406) {
                    throw error
                }

                if (data) {
                    setFullname(data.full_name)
                    setUsername(data.username)
                    setWebsite(data.website)
                    setAvatarUrl(data.avatar_url)
                }
            } catch (error) {
                console.log('Error loading user data!')
            } finally {
                setLoading(false)
            }
        }

        getProfile()
    }, [router, supabase])

    async function updateProfile({
        username,
        website,
        avatar_url,
        full_name,
    }: {
        username: string | null
        fullname: string | null
        website: string | null
        avatar_url: string | null
        full_name: string | null
    }) {
        try {
            setLoading(true)

            const { error } = await supabase.from('profiles').upsert({
                id: user?.id as string,
                full_name,
                username,
                website,
                avatar_url,
                updated_at: new Date().toISOString(),
            })
            if (error) throw error
            alert('Profile updated!')
        } catch (error) {
            alert('Error updating the data!')
        } finally {
            setLoading(false)
        }
    }

    if (loading) {
        return <div className="p-8">Loading...</div>
    }

    return (
        <div className="flex min-h-screen flex-col items-center bg-gray-50 py-12 sm:px-6 lg:px-8">
            <div className="sm:mx-auto sm:w-full sm:max-w-md">
                <h2 className="mt-6 text-center text-3xl font-extrabold text-gray-900">
                    Your Profile
                </h2>
            </div>

            <div className="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
                <div className="bg-white px-4 py-8 shadow sm:rounded-lg sm:px-10">
                    <div className="space-y-6">
                        <div>
                            <label htmlFor="email" className="block text-sm font-medium text-gray-700">
                                Email
                            </label>
                            <div className="mt-1">
                                <input
                                    id="email"
                                    type="text"
                                    value={user?.email}
                                    disabled
                                    className="block w-full appearance-none rounded-md border border-gray-300 bg-gray-100 px-3 py-2 placeholder-gray-400 shadow-sm sm:text-sm text-gray-500"
                                />
                            </div>
                        </div>

                        <div>
                            <label htmlFor="fullName" className="block text-sm font-medium text-gray-700">
                                Full Name
                            </label>
                            <div className="mt-1">
                                <input
                                    id="fullName"
                                    type="text"
                                    value={fullname || ''}
                                    onChange={(e) => setFullname(e.target.value)}
                                    className="block w-full appearance-none rounded-md border border-gray-300 px-3 py-2 placeholder-gray-400 shadow-sm focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm text-gray-900"
                                />
                            </div>
                        </div>

                        <div>
                            <label htmlFor="username" className="block text-sm font-medium text-gray-700">
                                Username
                            </label>
                            <div className="mt-1">
                                <input
                                    id="username"
                                    type="text"
                                    value={username || ''}
                                    onChange={(e) => setUsername(e.target.value)}
                                    className="block w-full appearance-none rounded-md border border-gray-300 px-3 py-2 placeholder-gray-400 shadow-sm focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm text-gray-900"
                                />
                            </div>
                        </div>

                        <div>
                            <label htmlFor="website" className="block text-sm font-medium text-gray-700">
                                Website
                            </label>
                            <div className="mt-1">
                                <input
                                    id="website"
                                    type="url"
                                    value={website || ''}
                                    onChange={(e) => setWebsite(e.target.value)}
                                    className="block w-full appearance-none rounded-md border border-gray-300 px-3 py-2 placeholder-gray-400 shadow-sm focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm text-gray-900"
                                />
                            </div>
                        </div>

                        <div>
                            <button
                                onClick={() => updateProfile({ fullname, username, website, avatar_url: avatarUrl, full_name: fullname })}
                                disabled={loading}
                                className="flex w-full justify-center rounded-md border border-transparent bg-indigo-600 px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
                            >
                                {loading ? 'Loading ...' : 'Update'}
                            </button>
                        </div>

                        <div className="text-center">
                            <button
                                onClick={() => router.push('/dashboard')}
                                className="text-sm font-medium text-indigo-600 hover:text-indigo-500"
                            >
                                Back to Dashboard
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}
