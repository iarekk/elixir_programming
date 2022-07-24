defmodule Ch15.Link1 do
  import :timer, only: [sleep: 1]

  def sad_function do
    sleep(500)
    exit(:boom)
  end

  def run do
    spawn(Ch15.Link1, :sad_function, [])

    receive do
      msg -> IO.puts("Message received: #{msg}")
    after
      1000 -> "Nothing has happened, ALL IS WELL"
    end
  end
end

Ch15.Link1.run()