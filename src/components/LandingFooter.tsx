'use client'

import Link from 'next/link'

export default function LandingFooter() {
  return (
    <footer className="border-t border-slate-200 bg-slate-50">
      <div className="container mx-auto px-8 py-12">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-12">
          <div className="space-y-4">
            <div className="flex items-center space-x-2">
              <span className="text-xl tracking-tight text-slate-900" style={{ fontWeight: 600 }}>Intraa</span>
            </div>
            <p className="text-sm text-slate-500">
              Prepare with purpose.
            </p>
          </div>
          
          <div className="space-y-4">
            <h4 className="text-sm font-semibold text-slate-900">Product</h4>
            <div className="flex flex-col space-y-2">
              <Link href="/dashboard" className="text-sm text-slate-500 hover:text-indigo-600 transition-colors">
                Features
              </Link>
              <Link href="/" className="text-sm text-slate-500 hover:text-indigo-600 transition-colors">
                Pricing
              </Link>
            </div>
          </div>
          
          <div className="space-y-4">
            <h4 className="text-sm font-semibold text-slate-900">Company</h4>
            <div className="flex flex-col space-y-2">
              <Link href="/" className="text-sm text-slate-500 hover:text-indigo-600 transition-colors">
                About
              </Link>
              <Link href="/" className="text-sm text-slate-500 hover:text-indigo-600 transition-colors">
                Blog
              </Link>
            </div>
          </div>
          
          <div className="space-y-4">
            <h4 className="text-sm font-semibold text-slate-900">Legal</h4>
            <div className="flex flex-col space-y-2">
              <Link href="/" className="text-sm text-slate-500 hover:text-indigo-600 transition-colors">
                Privacy
              </Link>
              <Link href="/" className="text-sm text-slate-500 hover:text-indigo-600 transition-colors">
                Terms
              </Link>
            </div>
          </div>
        </div>
        
        <div className="mt-12 pt-8 border-t border-slate-200">
          <p className="text-sm text-slate-500 text-center">
            © 2024 Intraa. All rights reserved.
          </p>
        </div>
      </div>
    </footer>
  )
}