defmodule Sequence2.MixProject do
  use Mix.Project

  def project do
    [
      app: :sequence2,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {
        Sequence2.Application, []
      },
      extra_applications: [:logger],
      registered: [Sequence2.Server],
      env: [initial_number: 456]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:distillery, "~> 2.1"}
    ]
  end
end
