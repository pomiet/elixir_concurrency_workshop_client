defmodule Sendr do
  def connect(host, port) do
    opts = [:binary, active: false]

    :gen_tcp.connect(to_charlist(host), port, opts)
  end

  def send_message(socket, message) do
    write_line("#{message}\r\n", socket)
    read_line(socket)
  end

  defp read_line(socket) do
    :gen_tcp.recv(socket, 0)
  end

  defp write_line(line, socket) do
    :gen_tcp.send(socket, line)
  end
end
