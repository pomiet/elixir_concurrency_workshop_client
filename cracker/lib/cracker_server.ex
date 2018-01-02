defmodule CrackerServer do
  use GenServer

  # ----------------------------------------- #
  # Client - API                              #
  # i.e. Client calls the following functions #
  # ----------------------------------------- #

  def pick_lock(socket) do
    # what should i do now?
  end

  def pick_lock(server_pid, socket) do
    # what should i do now?
  end

  def start_link([socket]) do
    # what should i do now?
  end

  def start_link(socket) do
    # what should i do now?
  end

  def stop() do
    # what should i do now?
  end

  # ----------------------------------------- #
  # Server - API                              #
  # i.e. Server calls the following functions #
  # ----------------------------------------- #

  def init([socket]) do
    # what should i do now?
  end

  def handle_call({:pick, socket}, _from, [socket]) do
    # what should i do now?
  end

  def examine_contents({:ok, message}) do
    # what should i do now?
  end

  def examine_contents({:error, message}) do
    # what should i do now?
  end

  defp ref(server_name) do
    # what should i do now?
  end

  defp try_call(server_id, message) do
    # what should i do now?
  end
end
