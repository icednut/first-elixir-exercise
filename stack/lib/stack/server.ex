defmodule Stack.Server do
  use GenServer

  def init(initial_array) do
    { :ok, initial_array }
  end

  def handle_call(:pop, _from, []) do
    { :reply, [], [] }
  end

  def handle_call(:pop, _from, [head]) do
    { :reply, [head], head }
  end

  # TODO tail이 \t일 경우에 대한 처리도 필요함. 이걸 어떻게 분기할까?
  def handle_call(:pop, _from, [head|tail]) do
    { :reply, [head|tail], tail }
  end
end
