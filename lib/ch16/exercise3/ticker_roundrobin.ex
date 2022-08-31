defmodule Ch16.Exercise3.TickerRoundrobin do
  @interval 2000
  @name :ticker_roundrobin

  def start do
    pid = spawn(__MODULE__, :generator, [[], 1])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    server_pid = :global.whereis_name(@name)
    send(server_pid, {:register, client_pid})
  end

  def generator(clients, tick_number) do
    receive do
      {:register, client_pid} ->
        IO.puts("registering #{inspect(client_pid)}")
        generator([client_pid | clients], tick_number)
    after
      @interval ->
        IO.puts("tick #{tick_number}")
        Enum.each(clients, fn cl -> send(cl, {:tick, tick_number}) end)
        generator(clients, tick_number + 1)
    end
  end
end
