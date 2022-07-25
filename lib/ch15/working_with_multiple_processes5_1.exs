defmodule Ch15.WorkingWithMultipleProcesses51 do
  import :timer, only: [sleep: 1]

  def spawned_process(parent_pid) do
    send(parent_pid, :caboom)
    exit(:normal)
  end

  def run do
    spawn_monitor(Ch15.WorkingWithMultipleProcesses51, :spawned_process, [self()])
    IO.puts("spawned!")
    sleep(500)

    receive do
      msg -> IO.puts("Received message: #{inspect(msg)}")
    end
  end
end

Ch15.WorkingWithMultipleProcesses51.run()
