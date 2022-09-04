# The ticker process in this chapter is a central server that sends events to
# registered clients. Reimplement this as a ring of clients. A client sends a
# tick to the next client in the ring. After 2 seconds, that client sends a tick
# to its next client.
# When thinking about how to add clients to the ring, remember to deal
# with the case where a client’s receive loop times out just as you’re adding
# a new process. What does this say about who has to be responsible for
# updating the links?

defmodule Ch16.Exercise4.TickerRing do
  @interval 2000
  # @name :ticker_ring

  def generate(client_id, next_pid, is_active) do
    receive do
      {:tick, sender_id} ->
        IO.puts("client ##{client_id} received tick from ##{sender_id}")
        generate(client_id, next_pid, true)

      {:register, new_client_pid} ->
        IO.puts(
          "client ##{client_id} received registration with PID ##{inspect(new_client_pid)}, current next in line: #{inspect(next_pid)}"
        )

        if(is_nil(next_pid)) do
          IO.puts(
            "sending repoint request to #{inspect(new_client_pid)}, repointing to #{inspect(self())}"
          )

          send(new_client_pid, {:repoint, self()})
        else
          IO.puts(
            "sending repoint request to #{inspect(new_client_pid)}, repointing to #{inspect(next_pid)}"
          )

          send(new_client_pid, {:repoint, next_pid})
        end

        generate(client_id, new_client_pid, is_active)

      {:repoint, new_client_pid} ->
        IO.puts(
          "client ##{client_id} received repoint with PID ##{inspect(new_client_pid)}, current next in line: #{inspect(next_pid)}"
        )

        generate(client_id, new_client_pid, is_active)
    after
      @interval ->
        if(is_active) do
          IO.puts("tick at ##{client_id}, sending to #{inspect(next_pid)}")

          if(next_pid != nil) do
            send(next_pid, {:tick, client_id})
            generate(client_id, next_pid, false)
          else
            generate(client_id, next_pid, is_active)
          end
        else
          # IO.puts("client ##{client_id} not active, doing nothing...")
          generate(client_id, next_pid, is_active)
        end
    end
  end
end

pid1 = spawn(Ch16.Exercise4.TickerRing, :generate, ["1", nil, true])
IO.puts("pid1: #{inspect(pid1)}")
pid2 = spawn(Ch16.Exercise4.TickerRing, :generate, ["2", nil, false])
IO.puts("pid2: #{inspect(pid2)}")
send(pid1, {:register, pid2})
pid3 = spawn(Ch16.Exercise4.TickerRing, :generate, ["3", nil, false])
IO.puts("pid3: #{inspect(pid3)}")
send(pid2, {:register, pid3})
pid4 = spawn(Ch16.Exercise4.TickerRing, :generate, ["4", nil, false])
IO.puts("pid4: #{inspect(pid4)}")
send(pid3, {:register, pid4})

# A -> B -> C -> A
# global handle pointing at A
# D -> A, then C must point to D (D -> A -> B -> C -> D)
# needed: update C, furthermost from A
# D -> B, then A must point to D
