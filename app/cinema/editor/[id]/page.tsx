import CinemaEditorClient from "./page-client"

export default async function EditorPage(props: { params: Promise<{ id: string }> }) {
    const params = await props.params
    return <CinemaEditorClient projectId={params.id} />
}
