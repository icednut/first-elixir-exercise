defmodule Stack.Server do
  use GenServer

  def start_link(stack) do
    GenServer.start_link(__MODULE__, stack, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(element) do
    GenServer.call(__MODULE__, {:push, element})
  end

  def init(initial_array) do
    { :ok, initial_array }
  end

  def handle_call(:pop, _from, stack) do
    next_stack = pop(stack)

    IO.puts("\n[current_stack]")
    print_stack(stack)
    IO.puts("\n[next_stack]")
    print_stack(next_stack)
    IO.puts("\n[_from] #{inspect _from}")

    { :reply, next_stack, next_stack }
  end

  def handle_call({:push, element}, _from, stack) do
    next_stack = [element | stack]
    { :reply, next_stack, next_stack }
  end

  defp pop([]) do
    IO.puts("비어있음")
    []
  end
  defp pop([head]) do
    IO.puts("하나만 있음, #{head}")
    []
  end
  defp pop([head | tail]) do
    IO.puts("head: #{head}")
    IO.puts("tail:")
    print_stack(tail)
    tail
  end

  defp print_stack(stack) do
    for elem <- stack do
      IO.puts("elem: #{elem}")
    end
  end
end
