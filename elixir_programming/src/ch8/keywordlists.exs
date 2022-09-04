defmodule Cars do
  @defaults [make: "Tesla", color: "Red", model: "X"]

  def make_car(owner, options \\ []) do
    options = Keyword.merge(@defaults, options)
    IO.puts("Making a car for #{owner}")
    IO.puts("A #{options[:color]} #{options[:make]} model #{options[:model]}")
    IO.puts("Extra features selected: #{Keyword.get_values(options, :extras) |> inspect}\n")
  end
end

Cars.make_car("Random Person")
Cars.make_car("George Martin", color: "plum", model: "S")
Cars.make_car("Peculiar buyer", color: "pink", extras: "cup holder", extras: "tow bar")
