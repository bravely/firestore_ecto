defmodule FirestoreEctoTest do
  use ExUnit.Case
  alias FirestoreEcto, as: Adapter

  describe "init" do
    test "returns expected initialization values" do
      child_spec = Adapter.child_spec()
      assert {:ok, ^child_spec, %{}} = Adapter.init(:ok)
    end
  end

  describe "ensure_all_started/2" do
    test "just returns its own module" do
      assert {:ok, [Adapter]} = Adapter.ensure_all_started(%{}, :permanent)
    end
  end

  describe "checkout/3" do
    test "just runs and returns the given function" do
      assert :ok = Adapter.checkout(%{}, %{}, fn -> :ok end)
    end
  end

  test "checked_out?/1" do
    assert false == Adapter.checked_out?(%{})
  end

  describe "dumpers/2" do
    test "just returns what is given" do
      assert [:string] = Adapter.dumpers(:foo, :string)
    end
  end

  describe "loaders/2" do
    test "just returns what is given" do
      assert [:string] = Adapter.loaders(:foo, :string)
    end
  end
end
