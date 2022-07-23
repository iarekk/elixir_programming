defmodule Ch15.Spawn2 do
  def greet do
    receive do
      {sender, msg} ->
        send(sender, {:ok, "Hello #{msg}"})
    end
    greet()
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
after
  500 ->
    IO.puts(
      "Long ago, this city was home to dragons and their hoarded wealth, but today the wind whistles through the empty halls."
    )
end
