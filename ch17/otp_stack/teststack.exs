{:ok, pid} = GenServer.start_link(OtpStack.Server, ["peek", "a", :boo, 92, "crashes after here"])
IO.puts("Pop item: #{GenServer.call(pid, :pop)}")
IO.puts("Pop item: #{GenServer.call(pid, :pop)}")
IO.puts("Pop item: #{GenServer.call(pid, :pop)}")
IO.puts("Pop item: #{GenServer.call(pid, :pop)}")
IO.puts("Push item: #{GenServer.cast(pid, {:push, "PUSHED"})}")
IO.puts("Push item: #{GenServer.cast(pid, {:push, "PUSHED1"})}")
IO.puts("Pop item: #{GenServer.call(pid, :pop)}")
IO.puts("Pop item: #{GenServer.call(pid, :pop)}")
IO.puts("Pop item: #{GenServer.call(pid, :pop)}")
IO.puts("Pop item: #{GenServer.call(pid, :pop)}")
