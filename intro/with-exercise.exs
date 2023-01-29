import Integer

m = %{a: 1, c: 3}

a =
  with {:ok, number} <- Map.fetch(m, :a),
    true <- is_even(number) do
      IO.puts("#{number} divided by 2 is #{div(number, 2)}")
      :even
  else
    :error ->
      IO.puts("We don't have this item in map")
      :error
    _ ->
      IO.puts("It is odd")
      :odd
  end
