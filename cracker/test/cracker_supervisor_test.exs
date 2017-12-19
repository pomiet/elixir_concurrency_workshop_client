defmodule CrackerSupervisor.Test do
  use ExUnit.Case

  setup do
    {:ok, socket} = Sendr.connect('localhost', 2347)
    {:ok, server_pid} = CrackerSupervisor.start_link([socket])
    {:ok, [server: server_pid, socket: socket]}
  end
end
