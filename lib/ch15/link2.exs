defmodule Ch15.Link2 do
  import :timer, only: [sleep: 1]

  def sad_function do
    sleep(500)
    exit(:boom)
  end

  def run do
    spawn_link(Ch15.Link2, :sad_function, [])

    receive do
      msg -> IO.puts("Message received: #{inspect(msg)}")
    after
      1000 -> "Nothing has happened, ALL IS WELL"
    end
  end
end

Ch15.Link2.run()

# > elixir -r lib/ch15/link2.exs
# ** (EXIT from #PID<0.95.0>) :boom
