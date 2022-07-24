defmodule Ch15.Spawn1 do
  def greet do
    receive do
      {sender, msg} ->
        send(sender, {:ok, "Hello #{msg}"})
    end
  end
end

pid = spawn(Ch15.Spawn1, :greet, [])

send(pid, {self(), "World!"})

receive do
  {:ok, resp} -> IO.puts(resp)
end
