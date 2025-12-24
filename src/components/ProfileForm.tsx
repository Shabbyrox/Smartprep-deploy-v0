'use client'

import { createClient } from '@/utils/supabase/client'
import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { MapPin, Phone, Briefcase, Globe, X, Plus } from 'lucide-react'

interface ProfileFormProps {
    user: any
    profile: {
        full_name: string | null
        username: string | null
        website: string | null
        avatar_url: string | null
        phone: string | null
        location: string | null
        target_role: string | null
        preferred_industry: string | null
        skills: string[] | null
    } | null
}

export default function ProfileForm({ user, profile }: ProfileFormProps) {
    const supabase = createClient()
    const router = useRouter()
    
    const [loading, setLoading] = useState(false)
    
    // Personal Info
    const [fullname, setFullname] = useState(profile?.full_name || '')
    const [phone, setPhone] = useState(profile?.phone || '')
    const [location, setLocation] = useState(profile?.location || '')
    const [website, setWebsite] = useState(profile?.website || '')
    
    // Career Goals
    const [targetRole, setTargetRole] = useState(profile?.target_role || '')
    const [preferredIndustry, setPreferredIndustry] = useState(profile?.preferred_industry || '')
    
    // Skills
    const [skills, setSkills] = useState<string[]>(profile?.skills || [])
    const [newSkill, setNewSkill] = useState('')

    // Helper: Get Initials for Avatar
    const getInitials = (name: string) => {
        return name
            ? name.split(' ').map((n) => n[0]).join('').substring(0, 2).toUpperCase()
            : user.email?.substring(0, 2).toUpperCase()
    }

    // Helper: Add Skill
    const handleAddSkill = () => {
        if (newSkill.trim() && !skills.includes(newSkill.trim())) {
            setSkills([...skills, newSkill.trim()])
            setNewSkill('')
        }
    }

    // Helper: Remove Skill
    const handleRemoveSkill = (skillToRemove: string) => {
        setSkills(skills.filter(skill => skill !== skillToRemove))
    }

    async function updateProfile() {
        try {
            setLoading(true)

            const { error } = await supabase.from('profiles').upsert({
                id: user?.id,
                full_name: fullname,
                phone,
                location,
                website,
                target_role: targetRole,
                preferred_industry: preferredIndustry,
                skills,
                updated_at: new Date().toISOString(),
            })
            if (error) throw error
            alert('Profile updated successfully!')
            router.refresh()
        } catch (error) {
            alert('Error updating profile!')
            console.error(error)
        } finally {
            setLoading(false)
        }
    }

    return (
        <div className="bg-white shadow rounded-lg overflow-hidden">
            {/* Header / Avatar Section */}
            <div className="bg-indigo-600 px-4 py-8 sm:px-6 flex flex-col items-center">
                <div className="h-24 w-24 rounded-full bg-indigo-200 border-4 border-white flex items-center justify-center text-3xl font-bold text-indigo-700 shadow-lg">
                    {getInitials(fullname)}
                </div>
                <h2 className="mt-4 text-xl font-bold text-white">
                    {fullname || 'Your Name'}
                </h2>
                <p className="text-indigo-200 text-sm">{user?.email}</p>
            </div>

            <div className="p-6 space-y-8">
                
                {/* 1. Personal Information */}
                <div>
                    <h3 className="text-lg font-medium leading-6 text-gray-900 border-b pb-2 mb-4">
                        Personal Information
                    </h3>
                    <div className="grid grid-cols-1 gap-y-6 gap-x-4 sm:grid-cols-2">
                        <div className="sm:col-span-2">
                            <label className="block text-sm font-medium text-gray-700">Full Name</label>
                            <input
                                type="text"
                                value={fullname}
                                onChange={(e) => setFullname(e.target.value)}
                                className="mt-1 text-gray-700 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm border p-2"
                            />
                        </div>

                        <div>
                            <label className="block text-sm font-medium text-gray-700">Phone</label>
                            <div className="mt-1 flex rounded-md shadow-sm">
                                <span className="inline-flex items-center px-3 rounded-l-md border border-r-0 border-gray-300 bg-gray-50 text-gray-500 sm:text-sm">
                                    <Phone className="h-4 w-4" />
                                </span>
                                <input
                                    type="tel"
                                    value={phone}
                                    onChange={(e) => setPhone(e.target.value)}
                                    className="flex-1 text-gray-700 block w-full rounded-none rounded-r-md border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm border p-2"
                                    placeholder="+91 5628276822"
                                />
                            </div>
                        </div>

                        <div>
                            <label className="block text-sm font-medium text-gray-700">Location</label>
                            <div className="mt-1 flex rounded-md shadow-sm">
                                <span className="inline-flex items-center px-3 rounded-l-md border border-r-0 border-gray-300 bg-gray-50 text-gray-500 sm:text-sm">
                                    <MapPin className="h-4 w-4" />
                                </span>
                                <input
                                    type="text"
                                    value={location}
                                    onChange={(e) => setLocation(e.target.value)}
                                    className="flex-1 text-gray-700 block w-full rounded-none rounded-r-md border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm border p-2"
                                    placeholder="Mumbai, India"
                                />
                            </div>
                        </div>

                        <div className="sm:col-span-2">
                            <label className="block text-sm font-medium text-gray-700">Website / Portfolio</label>
                            <div className="mt-1 flex rounded-md shadow-sm">
                                <span className="inline-flex items-center px-3 rounded-l-md border border-r-0 border-gray-300 bg-gray-50 text-gray-500 sm:text-sm">
                                    <Globe className="h-4 w-4" />
                                </span>
                                <input
                                    type="url"
                                    value={website}
                                    onChange={(e) => setWebsite(e.target.value)}
                                    className="flex-1 text-gray-700 block w-full rounded-none rounded-r-md border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm border p-2"
                                    placeholder="https://mysite.com"
                                />
                            </div>
                        </div>
                    </div>
                </div>

                {/* 2. Career Goals */}
                <div>
                    <h3 className="text-lg font-medium leading-6 text-gray-900 border-b pb-2 mb-4">
                        Career Goals
                    </h3>
                    <div className="grid grid-cols-1 gap-y-6 gap-x-4 sm:grid-cols-2">
                        <div>
                            <label className="block text-sm font-medium text-gray-700">Target Role</label>
                            <div className="mt-1 flex rounded-md shadow-sm">
                                <span className="inline-flex items-center px-3 rounded-l-md border border-r-0 border-gray-300 bg-gray-50 text-gray-500 sm:text-sm">
                                    <Briefcase className="h-4 w-4" />
                                </span>
                                <input
                                    type="text"
                                    value={targetRole}
                                    onChange={(e) => setTargetRole(e.target.value)}
                                    className="flex-1 text-gray-700 block w-full rounded-none rounded-r-md border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm border p-2"
                                    placeholder="Senior Software Engineer"
                                />
                            </div>
                        </div>

                        <div>
                            <label className="block text-sm font-medium text-gray-700">Preferred Industry</label>
                            <input
                                type="text"
                                value={preferredIndustry}
                                onChange={(e) => setPreferredIndustry(e.target.value)}
                                className="mt-1 text-gray-700 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm border p-2"
                                placeholder="Fintech, SaaS, AI..."
                            />
                        </div>
                    </div>
                </div>

                {/* 3. Skills */}
                <div>
                    <h3 className="text-lg font-medium leading-6 text-gray-900 border-b pb-2 mb-4">
                        Skills
                    </h3>
                    <div>
                        <div className="flex gap-2">
                            <input
                                type="text"
                                value={newSkill}
                                onChange={(e) => setNewSkill(e.target.value)}
                                onKeyDown={(e) => e.key === 'Enter' && handleAddSkill()}
                                className="block w-full text-gray-700 rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm border p-2"
                                placeholder="Add a skill (e.g. React, Python)"
                            />
                            <button
                                onClick={handleAddSkill}
                                type="button"
                                className="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none"
                            >
                                <Plus className="h-4 w-4" />
                            </button>
                        </div>
                        
                        <div className="mt-4 flex flex-wrap gap-2">
                            {skills.map((skill, index) => (
                                <span
                                    key={index}
                                    className="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-indigo-100 text-indigo-800"
                                >
                                    {skill}
                                    <button
                                        type="button"
                                        onClick={() => handleRemoveSkill(skill)}
                                        className="ml-2 inline-flex items-center justify-center text-indigo-400 hover:text-indigo-600 focus:outline-none"
                                    >
                                        <X className="h-3 w-3" />
                                    </button>
                                </span>
                            ))}
                            {skills.length === 0 && (
                                <p className="text-sm text-gray-500 italic">No skills added yet.</p>
                            )}
                        </div>
                    </div>
                </div>

                {/* Footer Buttons */}
                <div className="pt-5 border-t border-gray-200">
                    <div className="flex justify-end gap-3">
                        <button
                            type="button"
                            onClick={() => router.push('/dashboard')}
                            className="bg-white py-2 px-4 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                        >
                            Cancel
                        </button>
                        <button
                            type="button"
                            onClick={updateProfile}
                            disabled={loading}
                            className="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 disabled:opacity-50"
                        >
                            {loading ? 'Saving...' : 'Save Changes'}
                        </button>
                    </div>
                </div>

            </div>
        </div>
    )
}