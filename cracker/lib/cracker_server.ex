defmodule CrackerServer do
  use GenServer

  # ----------------------------------------- #
  # Client - API                              #
  # i.e. Client calls the following functions #
  # ----------------------------------------- #

  def pick_lock(socket) do
    GenServer.call(__MODULE__,  {:pick, socket})
  end

  def pick_lock(server_pid, socket) do
    GenServer.call(server_pid, {:pick, socket})
  end

  def start_link([socket]) do
    GenServer.start_link(__MODULE__, [socket], name: __MODULE__)
  end

  def start_link(socket) do
    GenServer.start_link(__MODULE__, [socket], name: __MODULE__)
  end

  def stop() do
    GenServer.stop(__MODULE__)
  end

  # ----------------------------------------- #
  # Server - API                              #
  # i.e. Server calls the following functions #
  # ----------------------------------------- #

  def init([socket]) do
    {:ok, [socket]}
  end

  def handle_call({:pick, socket}, _from, [socket]) do
    message = 120..130
      |> Enum.map(fn(guess) ->
            Sendr.send_message(socket, guess)
            |> examine_contents
          end )
      |> Enum.reject(fn(value) -> value == "Can't crack me!" end)
      |> List.first

    {:reply, {:ok, message}, []}
  end

  def examine_contents({:ok, message}) do
    # found it, so just return
    message
  end

  def examine_contents({:error, message}) do
    # do nothing since i got nothing
    message
  end

end
