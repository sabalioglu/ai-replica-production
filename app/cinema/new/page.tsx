'use client'
import dynamic from 'next/dynamic'

const CinemaNewProjectClient = dynamic(() => import("./page-client"), { ssr: false })

export default function NewProjectPage() {
    return <CinemaNewProjectClient />
}
