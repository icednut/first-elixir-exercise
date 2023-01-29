defmodule Speaker do
  def echo(sender_pid) do
    receive do
      message ->
        send(sender_pid, message)
    end
  end

  def run(n) do
    my_actor = spawn(Speaker, :echo, [self()])

    send(my_actor, "Hello, echo")

    receive do
      echo_message ->
        IO.inspect(echo_message)
    end
  end
end
