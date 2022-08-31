defmodule Ch16.Exercise3.TickerClientRoundrobin do
  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Ch16.Exercise3.TickerRoundrobin.register(pid)
  end

  def receiver do
    receive do
      {:tick, num} ->
        IO.puts("tock ##{num} in client")
        receiver()
    end
  end
end
