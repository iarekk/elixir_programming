defmodule Ch15.Fib do
  def fib(scheduler) do
    send(scheduler, {:ready, self()})

    receive do
      {:fib, n, client} ->
        send(client, {:answer, n, fib_solver(n), self()})
        fib(scheduler)

      {:terminate} ->
        exit(:normal)
    end
  end

  def fib_solver(n) when n <= 1, do: 1
  def fib_solver(n), do: fib_solver(n - 1) + fib_solver(n - 2)
end

defmodule Ch15.Scheduler do
  def run(num_processes, module, func, to_calculate) do
    1..num_processes
    |> Enum.map(fn _ -> spawn(module, func, [self()]) end)
    |> schedule_processes(to_calculate, [])
  end

  def schedule_processes(processes, inputs, results) do
    receive do
      {:ready, pid} when inputs != [] ->
        [next | tail] = inputs
        send(pid, {:fib, next, self()})
        schedule_processes(processes, tail, results)

      {:ready, pid} ->
        send(pid, {:terminate})

        if(length(processes) > 1) do
          schedule_processes(List.delete(processes, pid), inputs, results)
        else
          Enum.sort(results, fn {n1, _}, {n2, _} -> n1 <= n2 end)
        end

      {:answer, input, result, _pid} ->
        schedule_processes(processes, inputs, [{input, result} | results])
    end
  end
end

# :timer.tc( Ch15.Scheduler, :run, [2, Ch15.Fib, :fib, Enum.to_list(20..40)])
