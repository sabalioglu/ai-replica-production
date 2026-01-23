import { createMiddlewareClient } from '@supabase/auth-helpers-nextjs'
import { NextResponse } from 'next/server'
import type { NextRequest } from 'next/server'

export async function middleware(req: NextRequest) {
    const res = NextResponse.next()

    // Create a Supabase client configured to use cookies
    const supabase = createMiddlewareClient({ req, res })

    // Refresh session if expired - required for Server Components
    const {
        data: { session },
    } = await supabase.auth.getSession()

    const requestUrl = new URL(req.url)

    // Protect /cinema routes
    if (requestUrl.pathname.startsWith('/cinema')) {
        if (!session) {
            return NextResponse.redirect(new URL('/login', req.url))
        }
    }

    // Redirect authenticated users away from /login
    if (requestUrl.pathname.startsWith('/login') && session) {
        return NextResponse.redirect(new URL('/cinema', req.url))
    }

    return res
}

export const config = {
    matcher: ['/cinema/:path*', '/login'],
}
