defmodule Cracker.Application do
  use Application

  def main(args \\ []) do
    {options, _, _} = parse_args(args)

    start(options[:host], options[:port])
  end

  def start(host, port) do
    {:ok, socket} = Sendr.connect(host, port)
    CrackerSupervisor.start_link([socket])
    {:ok, message} = CrackerServer.pick_lock(socket)
    IO.puts(message)
  end

  def parse_args(args \\ []) do
    OptionParser.parse(args, switches: [host: :string, port: :integer])
  end
end
