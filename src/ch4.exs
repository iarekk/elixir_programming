defmodule Ch4 do
  line_no = 50
  # ...
  if line_no == 50 do
    IO.puts("new-page\n")
    line_no = 0 # no reassignment leak anymore
    IO.puts(line_no)
    IO.puts("---\n")
  end

  IO.puts(line_no)
end
