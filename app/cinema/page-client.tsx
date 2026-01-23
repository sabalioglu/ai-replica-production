"use client"

import { useEffect, useState } from "react"
import Link from "next/link"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Plus } from "lucide-react"
import { supabase } from "@/lib/supabase"
import { useRouter } from "next/navigation"

interface Project {
    id: string
    name: string
    status: string
    created_at: string
}

export default function CinemaDashboardClient() {
    const [projects, setProjects] = useState<Project[]>([])
    const [loading, setLoading] = useState(true)
    const [credits, setCredits] = useState<number | null>(null)
    const router = useRouter()

    useEffect(() => {
        fetchProjects()
        fetchCredits()
    }, [])

    async function fetchCredits() {
        try {
            const { data: { user } } = await supabase.auth.getUser()
            if (!user) return

            const { getUserCredits } = await import('@/lib/credits')
            const creditInfo = await getUserCredits(user.id)

            if (creditInfo) {
                setCredits(creditInfo.balance)
            }
        } catch (error) {
            console.error('Error fetching credits:', error)
        }
    }

    async function fetchProjects() {
        try {
            const { data: { user } } = await supabase.auth.getUser()
            if (!user) {
                // Redirect to login if needed, or handle empty state
                console.log("No user found")
                return
            }

            const { data, error } = await supabase
                .from('cinema_projects')
                .select('*')
                .order('created_at', { ascending: false })

            if (error) throw error
            setProjects(data || [])
        } catch (error) {
            console.error('Error fetching projects:', error)
        } finally {
            setLoading(false)
        }
    }

    return (
        <div className="space-y-4">
            <div className="flex items-center justify-between">
                <div className="flex items-center gap-4">
                    <h2 className="text-3xl font-bold tracking-tight">Projects</h2>
                    {credits !== null && (
                        <div className="px-3 py-1 bg-primary/10 text-primary rounded-full text-sm font-medium">
                            {credits} Credits
                        </div>
                    )}
                </div>
                <Link href="/cinema/new">
                    <Button>
                        <Plus className="mr-2 h-4 w-4" /> Create New
                    </Button>
                </Link>
            </div>

            {loading ? (
                <div>Loading...</div>
            ) : projects.length === 0 ? (
                <Card>
                    <CardContent className="flex flex-col items-center justify-center p-6 text-center">
                        <p className="mb-4 text-muted-foreground">No projects found.</p>
                        <Link href="/cinema/new">
                            <Button variant="outline">Create your first project</Button>
                        </Link>
                    </CardContent>
                </Card>
            ) : (
                <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
                    {projects.map((project) => (
                        <Link href={`/cinema/editor/${project.id}`} key={project.id}>
                            <Card className="hover:bg-accent/50 transition-colors cursor-pointer">
                                <CardHeader>
                                    <CardTitle>{project.name}</CardTitle>
                                </CardHeader>
                                <CardContent>
                                    <div className="text-sm text-muted-foreground">
                                        Status: <span className="capitalize font-medium text-foreground">{project.status}</span>
                                    </div>
                                    <div className="text-xs text-muted-foreground mt-2">
                                        {new Date(project.created_at).toLocaleDateString()}
                                    </div>
                                </CardContent>
                            </Card>
                        </Link>
                    ))}
                </div>
            )}
        </div>
    )
}
