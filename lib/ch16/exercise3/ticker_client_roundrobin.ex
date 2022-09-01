defmodule Ch16.Exercise3.TickerClientRoundrobin do
  def start(client_number) do
    pid = spawn(__MODULE__, :receiver, [client_number])
    Ch16.Exercise3.TickerRoundrobin.register(pid)
  end

  def receiver(client_number) do
    receive do
      {:tick, num} ->
        IO.puts("tock ##{num} in client ##{client_number}")
        receiver(client_number)
    end
  end
end
