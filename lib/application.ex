defmodule MyApplication do
  require Logger

  def start(_type, _args) do
    Logger.info("Application started")

    Supervisor.start_link([], strategy: :one_for_one, name: MyApplication.Supervisor)
  end
end
