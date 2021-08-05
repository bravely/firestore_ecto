defmodule FirestoreEcto do
  @behaviour Ecto.Adapter

  @type t :: module

  @type adapter_meta :: %{
    cache: identifier(),
    pid: pid()
  }

  @impl true
  defmacro __before_compile__(_env), do: nil

  @impl true
  def init(_config) do
    {:ok, child_spec(), %{}}
  end

  @impl true
  def ensure_all_started(_config, _type) do
    {:ok, [__MODULE__]}
  end

  def child_spec do
    %{
      id: __MODULE__,
      start: {__MODULE__.Client, :start_link, []},
    }
  end

  @impl true
  def checkout(_adapter_meta, _config, function) do
    function.()
  end

  @impl true
  def checked_out?(_adapter_meta), do: false

  @impl true
  def dumpers(_primitive, type), do: [type]

  @impl true
  def loaders(_primitive, type), do: [type]
end
