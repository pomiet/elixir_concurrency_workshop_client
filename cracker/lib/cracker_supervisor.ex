defmodule CrackerSupervisor do
  use Supervisor

  def start_link([socket]) do
    children = [
      worker(CrackerServer, [socket])
    ]
    opts = [strategy: :one_for_one, name: Cracker.Supervisor]

    {:ok, _pid} = Supervisor.start_link(children, opts)
  end

  # def init(:ok) do
  #   children = [
  #     worker(CrackerServer, [socket])
  #   ]
  #   opts = [strategy: :one_for_one, name: LockedProcess.Supervisor]
  #
  #   Supervisor.start_link(children, opts)
  # end
end
