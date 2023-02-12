defmodule Stack.Stash do
  use GenServer

  @me __MODULE__

  def start_link(stack) do
    GenServer.start_link(__MODULE__, stack, name: @me)
  end

  def get do
    GenServer.call(@me, {:get})
  end

  def set(new_stack) do
    GenServer.cast(@me, {:set, new_stack})
  end

  def init(stack) do
    {:ok, stack}
  end

  def handle_call({:get}, _from, stack) do
    { :reply, stack, stack }
  end

  def handle_cast({:set, new_stack}, _stack) do
    {:noreply, new_stack}
  end
end
