defmodule Ch15.Monitor1 do
  import :timer, only: [sleep: 1]

  def sad_function do
    sleep(500)
    exit(:boom)
  end

  def run do
    monitor = spawn_monitor(Ch15.Monitor1, :sad_function, [])

    IO.puts("Monitor returned: #{inspect(monitor)}")

    receive do
      msg ->
        IO.puts("Message received: #{inspect(msg)}")
    after
      1000 -> "Nothing has happened, ALL IS WELL"
    end
  end
end

Ch15.Monitor1.run()

# > elixir -r lib/ch15/link3.exs
# Monitor returned: {#PID<0.101.0>, #Reference<0.3174407831.906756107.246573>}
# Message received: {:DOWN, #Reference<0.3174407831.906756107.246573>, :process, #PID<0.101.0>, :boom}
