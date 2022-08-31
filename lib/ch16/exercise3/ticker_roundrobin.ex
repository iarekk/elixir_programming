defmodule Ch16.Exercise3.TickerRoundrobin do
  @interval 2000
  @name :ticker_roundrobin

  def start do
    pid = spawn(__MODULE__, :generator, [[], [], 1])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    server_pid = :global.whereis_name(@name)
    send(server_pid, {:register, client_pid})
  end

  def generator(clients_todo, clients_done, tick_number) do
    receive do
      {:register, client_pid} ->
        IO.puts("registering #{inspect(client_pid)}")
        generator(clients_todo ++ [client_pid], clients_done, tick_number)
    after
      @interval ->
        IO.puts("tick #{tick_number}")

        if(Enum.empty?(clients_todo)) do
          if(Enum.empty?(clients_done)) do
            # nothing to do
            generator([], [], tick_number + 1)
          else
            # all done, rotating to the first
            [cl | rem_todo] = Enum.reverse(clients_done)
            send(cl, {:tick, tick_number})
            generator(rem_todo, [cl], tick_number + 1)
          end
        else
          # halfway through the pile
          [cl | rem_todo] = clients_todo
          send(cl, {:tick, tick_number})
          generator(rem_todo, [cl | clients_done], tick_number + 1)
        end
    end
  end
end
