defmodule Sequence.Server do
  use GenServer

  def init(initial_number) do
    {:ok, initial_number}
  end

  def handle_call(:next_number, _from, current_number) do
    {:reply, current_number, current_number + 1}
  end

  def handle_call({:set_number, new_number}, _from, _cur) do
    {:reply, {:set_to, new_number}, new_number}
  end

  def handle_cast({:increment_number, increment}, current_number) do
    {:noreply, current_number + increment}
  end
end
