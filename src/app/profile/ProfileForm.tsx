'use client'

import { useState } from 'react'
import { createClient } from '@/utils/supabase/client'
import { useRouter } from 'next/navigation'
import { User, Briefcase, MapPin, Globe, Phone, Save, Loader2 } from 'lucide-react'

export default function ProfileForm({ user, profile }: { user: any, profile: any }) {
    const supabase = createClient()
    const router = useRouter()
    const [loading, setLoading] = useState(false)
    const [message, setMessage] = useState<{ type: 'success' | 'error', text: string } | null>(null)

    const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault()
        setLoading(true)
        setMessage(null)

        const formData = new FormData(e.currentTarget)
        const updates = {
            id: user.id,
            full_name: formData.get('fullName'),
            username: formData.get('username'),
            website: formData.get('website'),
            phone: formData.get('phone'),
            location: formData.get('location'),
            target_role: formData.get('targetRole'),
            preferred_industry: formData.get('preferredIndustry'),
            skills: formData.get('skills'),
            updated_at: new Date().toISOString(),
        }

        const { error } = await supabase.from('profiles').upsert(updates)

        if (error) {
            setMessage({ type: 'error', text: 'Failed to update profile.' })
        } else {
            setMessage({ type: 'success', text: 'Profile updated successfully!' })
            router.refresh()
            setTimeout(() => setMessage(null), 3000)
        }
        setLoading(false)
    }

    // Reusable Input Component for cleaner code
    const ModernInput = ({ label, name, defaultValue, icon: Icon, placeholder, type = "text" }: any) => (
        <div className="space-y-2">
            <label htmlFor={name} className="text-sm font-medium text-slate-700">
                {label}
            </label>
            <div className="relative">
                {Icon && (
                    <div className="absolute left-3 top-2.5 text-slate-400">
                        <Icon className="h-4 w-4" />
                    </div>
                )}
                <input
                    type={type}
                    name={name}
                    id={name}
                    defaultValue={defaultValue || ''}
                    placeholder={placeholder}
                    className={`block w-full rounded-lg border border-slate-200 bg-white px-3 py-2 text-sm text-slate-900 placeholder-slate-400 shadow-sm transition-all focus:border-indigo-500 focus:outline-none focus:ring-1 focus:ring-indigo-500 ${Icon ? 'pl-10' : ''}`}
                />
            </div>
        </div>
    )

    return (
        <form onSubmit={handleSubmit} className="space-y-6">
            
            {/* Section 1: Personal Info */}
            <div className="bg-white rounded-xl border border-slate-200 shadow-sm overflow-hidden">
                <div className="border-b border-slate-100 bg-slate-50/50 px-6 py-4">
                    <h3 className="font-semibold text-slate-900 flex items-center gap-2">
                        <User className="h-4 w-4 text-indigo-600" />
                        Personal Information
                    </h3>
                </div>
                <div className="p-6 grid grid-cols-1 md:grid-cols-2 gap-6">
                    <ModernInput 
                        label="Full Name" 
                        name="fullName" 
                        defaultValue={profile?.full_name} 
                        placeholder="John Doe" 
                    />
                    <ModernInput 
                        label="Username" 
                        name="username" 
                        defaultValue={profile?.username} 
                        placeholder="johndoe" 
                    />
                    <ModernInput 
                        label="Phone Number" 
                        name="phone" 
                        defaultValue={profile?.phone} 
                        icon={Phone} 
                        placeholder="+1 (555) 000-0000" 
                    />
                    <ModernInput 
                        label="Location" 
                        name="location" 
                        defaultValue={profile?.location} 
                        icon={MapPin} 
                        placeholder="San Francisco, CA" 
                    />
                     <div className="md:col-span-2">
                        <ModernInput 
                            label="Website / Portfolio" 
                            name="website" 
                            defaultValue={profile?.website} 
                            icon={Globe} 
                            placeholder="https://yourportfolio.com" 
                        />
                    </div>
                </div>
            </div>

            {/* Section 2: Professional Details */}
            <div className="bg-white rounded-xl border border-slate-200 shadow-sm overflow-hidden">
                <div className="border-b border-slate-100 bg-slate-50/50 px-6 py-4">
                    <h3 className="font-semibold text-slate-900 flex items-center gap-2">
                        <Briefcase className="h-4 w-4 text-indigo-600" />
                        Professional Details
                    </h3>
                </div>
                <div className="p-6 grid grid-cols-1 md:grid-cols-2 gap-6">
                    <ModernInput 
                        label="Target Role" 
                        name="targetRole" 
                        defaultValue={profile?.target_role} 
                        placeholder="Software Engineer" 
                    />
                    <ModernInput 
                        label="Preferred Industry" 
                        name="preferredIndustry" 
                        defaultValue={profile?.preferred_industry} 
                        placeholder="Fintech, HealthTech" 
                    />
                    
                    {/* Skills Textarea */}
                    <div className="md:col-span-2 space-y-2">
                        <label htmlFor="skills" className="text-sm font-medium text-slate-700">
                            Skills
                        </label>
                        <textarea
                            name="skills"
                            id="skills"
                            rows={3}
                            defaultValue={profile?.skills || ''}
                            className="block w-full rounded-lg border border-slate-200 bg-white px-3 py-2 text-sm text-slate-900 placeholder-slate-400 shadow-sm transition-all focus:border-indigo-500 focus:outline-none focus:ring-1 focus:ring-indigo-500 resize-none"
                            placeholder="Java, React, Python, AWS..."
                        />
                        <p className="text-xs text-slate-500">Separate skills with commas.</p>
                    </div>
                </div>
            </div>

            {/* Bottom Action Bar */}
            <div className="flex items-center justify-end gap-4 pt-2">
                {message && (
                    <span className={`text-sm font-medium ${message.type === 'success' ? 'text-green-600' : 'text-red-600'}`}>
                        {message.text}
                    </span>
                )}
                <button
                    type="submit"
                    disabled={loading}
                    className="inline-flex items-center justify-center rounded-lg bg-indigo-600 px-6 py-2.5 text-sm font-medium text-white shadow-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 disabled:opacity-70 disabled:cursor-not-allowed transition-all"
                >
                    {loading ? (
                        <>
                            <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                            Saving...
                        </>
                    ) : (
                        <>
                            <Save className="mr-2 h-4 w-4" />
                            Save Changes
                        </>
                    )}
                </button>
            </div>
        </form>
    )
}