defmodule CrackerSupervisor do
  use Supervisor

  def start_link([socket]) do
    {:ok, _pid} = Supervisor.start_link(__MODULE__, [socket])
  end

  def init([socket]) do
    children = [
      worker(CrackerServer, [socket])
    ]
    opts = [strategy: :one_for_one, name: Cracker.Supervisor]

    supervise(children, opts)
  end

end
