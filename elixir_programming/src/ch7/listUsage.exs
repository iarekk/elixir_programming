IO.inspect([1, 2, 3] ++ [4, 5, 6])
IO.inspect(List.flatten([[[1], 2], [[[3]]]]))
IO.inspect(List.foldr([1, 2, 3, 4], 0, &"f(#{&1},#{&2})"))
IO.inspect(List.foldl([1, 2, 3, 4], 0, &"f(#{&1},#{&2})"))
kw = [{:name, "Dave"}, {:likes, "Programming"}, {:where, "Dallas", "TX"}]
IO.inspect(List.keyfind(kw, "Dallas", 1))
IO.inspect(List.keyfind(kw, :name, 0))
IO.inspect(List.keyfind(kw, "TX", 2))
IO.inspect(List.keyfind(kw, "TX", 1, "No such city"))
