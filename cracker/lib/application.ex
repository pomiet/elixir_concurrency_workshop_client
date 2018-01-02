defmodule Cracker.Application do
  use Application

  def main(args \\ []) do
    {options, _, _} = parse_args(args)

    start(options[:host], options[:port])
  end

  def start(host, port) do
    # what should i do now?
  end

  def parse_args(args \\ []) do
    OptionParser.parse(args, switches: [host: :string, port: :integer])
  end
end
