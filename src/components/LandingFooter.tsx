'use client'

import Link from 'next/link'
import { usePathname, useRouter } from 'next/navigation'

export default function LandingFooter() {
  const pathname = usePathname();
    const router = useRouter();
    
    const scrollToSection = (sectionId: string) => {
      if (pathname !== '/') {
        // If we are on Login page, go to Home first
        router.push('/');
        setTimeout(() => {
          const element = document.getElementById(sectionId);
          element?.scrollIntoView({ behavior: 'smooth' });
        }, 100);
      } else {
        // If we are already on Home
        const element = document.getElementById(sectionId);
        element?.scrollIntoView({ behavior: 'smooth' });
      }
    };

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
              <button
                onClick={() => scrollToSection('features')}
                className="text-sm transition-colors hover:text-indigo-600 text-slate-600 font-medium hidden md:block"
              >
                Features
              </button>
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
            © 2025 Intraa. All rights reserved.
          </p>
        </div>
      </div>
    </footer>
  )
}