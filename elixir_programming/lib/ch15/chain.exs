defmodule Ch15.Chain do
  def counter(next_pid) do
    receive do
      n -> send(next_pid, n + 1)
    end
  end

  def create_processes(n) do
    code_to_run = fn _, send_to ->
      pid = spawn(Ch15.Chain, :counter, [send_to])
      # IO.puts("Send to: #{inspect(send_to)}, created pid: #{inspect(pid)}")
      pid
    end

    last_pid = Enum.reduce(1..n, self(), code_to_run)

    IO.puts("Last pid: #{inspect(last_pid)}")

    send(last_pid, 0)

    receive do
      final_answer when is_integer(final_answer) -> "Result is #{inspect(final_answer)}"
    end
  end

  def run(n) do
    :timer.tc(Ch15.Chain, :create_processes, [n]) |> IO.inspect()
  end
end
