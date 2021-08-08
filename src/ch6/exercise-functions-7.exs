# – Convert a float to a string with two decimal digits. (Erlang)

# :erlang.float_to_binary/2
# :erlang.float_to_binary(1333.339, [decimals: 2])

:erlang.float_to_binary(1333.339, decimals: 2)

# – Get the value of an operating-system environment variable. (Elixir)

System.get_env("PATH")

# – Return the extension component of a file name (so return .exs if given "dave/test.exs"). (Elixir)

Path.extname("dave/test.exs")

# – Return the process’s current working directory. (Elixir)

File.cwd()

# – Convert a string containing JSON into Elixir data structures. (Just
# find; don’t install.)
# – Execute a command in your operating system’s shell.
