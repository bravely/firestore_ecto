defmodule FirestoreEcto.SchemaTest do
  alias FirestoreEcto.Schema

  describe "autogenerate/1" do
    test "generates UUIDs every time" do
      assert is_binary(Schema.autogenerate(:id))
      assert is_binary(Schema.autogenerate(:binary_id))
      assert is_binary(Schema.autogenerate(:embed_id))
    end
  end
end
