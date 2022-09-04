defmodule Ch15.WorkingWithMultipleProcesses2 do
  def process do
    receive do
      {tag, sender} ->
        send(sender, {:ok, tag})
        process()
    end
  end

  def run do
    pid1 = spawn(Ch15.WorkingWithMultipleProcesses2, :process, [])
    pid2 = spawn(Ch15.WorkingWithMultipleProcesses2, :process, [])

    me = self()
    send(pid1, {:fred, me})
    send(pid2, {:betty, me})

    listen_loop()
  end

  defp listen_loop do
    receive do
      {:ok, tag} ->
        IO.puts("Received: #{inspect(tag)}")
        listen_loop()
    after
      500 ->
        IO.puts("Exiting after 500ms")
    end
  end
end

Ch15.WorkingWithMultipleProcesses2.run()
