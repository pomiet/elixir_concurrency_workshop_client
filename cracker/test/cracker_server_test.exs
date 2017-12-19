defmodule CrackerServerTest do
  use ExUnit.Case

  setup do
    {:ok, socket} = Sendr.connect('localhost', 2347)
    {:ok, server_pid} = CrackerServer.start_link([socket])
    {:ok, [server: server_pid, socket: socket]}
  end

  test "try default combination returns ok", %{server: pid, socket: socket} do
    assert {:ok, "rock on"} == CrackerServer.pick_lock(pid, socket)
  end
end
