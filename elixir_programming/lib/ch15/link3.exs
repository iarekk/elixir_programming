defmodule Ch15.Link3 do
  import :timer, only: [sleep: 1]

  def sad_function do
    sleep(500)
    exit(:boom)
  end

  def run do
    Process.flag(:trap_exit, true)
    spawn_link(Ch15.Link3, :sad_function, [])

    receive do
      {:EXIT, pid, code} ->
        IO.puts("Exit code received from #{inspect(pid)} with code #{inspect(code)}")

      msg ->
        IO.puts("Message received: #{inspect(msg)}")
    after
      1000 -> "Nothing has happened, ALL IS WELL"
    end
  end
end

Ch15.Link3.run()

# > elixir -r lib/ch15/link3.exs
# Exit code received from #PID<0.101.0> with code :boom
