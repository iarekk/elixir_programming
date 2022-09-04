defmodule Ch16.TickerClient do
  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Ch16.Ticker.register(pid)
  end

  def receiver do
    receive do
      {:tick} ->
        IO.puts("tock in client")
        receiver()
    end
  end
end
