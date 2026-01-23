import CinemaEditorClient from "./page-client"

export default function EditorPage({ params }: { params: { id: string } }) {
    return <CinemaEditorClient projectId={params.id} />
}
