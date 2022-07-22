defmodule Ch15.SpawnBasic do
  def greet do
    IO.puts("Hello")
  end
end

# iex(1)> spawn(Ch15.SpawnBasic, :greet, [])
# Hello
# PID<0.211.0>
