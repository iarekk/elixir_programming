defmodule Ch15.WorkingWithMultipleProcesses3 do
  import :timer, only: [sleep: 1]

  def spawned_process(parent_pid) do
    send(parent_pid, :caboom)
    exit(:normal)
  end

  def run do
    spawn_link(Ch15.WorkingWithMultipleProcesses3, :spawned_process, [self()])
    IO.puts("spawned!")
    sleep(500)

    receive do
      msg -> IO.puts("Received message: #{inspect(msg)}")
    end
  end
end

Ch15.WorkingWithMultipleProcesses3.run()
