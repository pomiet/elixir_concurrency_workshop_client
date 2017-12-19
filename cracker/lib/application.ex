defmodule Cracker.Application do
  use Application

  def main(args \\ []) do
    {options, _, _} = parse_args(args)

    start(options[:host], options[:port])
  end

  def start(host, port) do
    {:ok, socket} = Sendr.connect(host, port)
    CrackerSupervisor.start_link([socket])
  end

  # def start(_type, args) do
  #   {options, _, _} = parse_args(args)
  #
  #   start(options[:host], options[:port])
  # end


  def parse_args(args \\ []) do
    OptionParser.parse(args, switches: [host: :string, port: :integer])
  end
end
