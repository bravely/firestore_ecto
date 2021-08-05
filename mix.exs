defmodule FirestoreEcto.MixProject do
  use Mix.Project

  def project do
    [
      app: :firestore_ecto,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, "~> 3.6"},
      {:google_api_firestore, "~> 0.21"}
    ]
  end
end
