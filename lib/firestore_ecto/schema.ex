defmodule FirestoreEcto.Schema do
  @behaviour Ecto.Adapter.Schema

  @impl true
  def autogenerate(_field_type) do
    Ecto.UUID.generate()
  end

  @impl true
  def insert(%{client: client}, %{schema: schema}, fields, _on_conflict, _returning, _options) do
    document_id = Keyword.fetch!(fields, :id)
    case create_document(client, schema.parent(), schema.collection_id(), document_id, fields) do
      {:ok, document} -> {:ok, Enum.map(document.fields, fn({key, value}) -> {String.to_existing_atom(key), value} end)}
      {:error, info} -> {:invalid, info}
    end
  end

  defp create_document(client, parent, collection_id, document_id, fields) do
    GoogleApi.Firestore.V1.Api.Projects.firestore_projects_databases_documents_create_document(
      client,
      parent,
      collection_id,
      [
        fields: fields,
        documentId: document_id,
        body: Document.build(fields)
      ]
    )
  end
end
