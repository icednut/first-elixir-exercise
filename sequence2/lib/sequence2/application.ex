defmodule Sequence2.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Sequence2.Worker.start_link(arg)
      # {Sequence2.Worker, arg}
      {Sequence2.Stash, Application.get_env(:sequence2, :initial_number)},
      {Sequence2.Server, nil}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :rest_for_one, name: Sequence2.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
