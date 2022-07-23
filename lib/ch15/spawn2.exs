defmodule Ch15.Spawn2 do
  def greet do
    receive do
      {sender, msg} ->
        send(sender, {:ok, "Hello #{msg}"})
    end
  end
end

pid = spawn(Ch15.Spawn2, :greet, [])
send(pid, {self(), "World!"})

receive do
  {:ok, resp} -> IO.puts(resp)
end

send(pid, {self(), "Computer!"})

receive do
  {:ok, resp} -> IO.puts(resp)
end
