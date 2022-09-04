map = %{name: "Dave", likes: "Programming", where: "Dallas"}

IO.inspect(map)
IO.inspect(Map.drop(map, [:name]))
IO.inspect(Map.put(map, :pet, "Dawg"))

{val, newmap} = Map.pop(map, :where)

IO.inspect(val)
IO.inspect(newmap)

person = %{name: "Dave", height: 1.88}
person1 = %{name: "David", height: 1.89}
%{name: a_name} = person
IO.inspect(a_name)

%{name: a_name, height: a_height} = person1

IO.inspect({a_name, a_height})

for key <- [:name, :likes] do
  %{^key => v} = map
  IO.inspect(v)
end

# only update existing keys, can't add a new key
newName = %{map | :name => "Colin"}
IO.inspect(newName)

# not allowed:
# newStuff = %{map | :surname => "Colin"}
