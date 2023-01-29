defmodule Chain do
  def counter(next_pid) do
    receive do
      n ->
        send(next_pid, n + 1)
    end
  end

  def create_processes(n) do
    code_to_run = fn (_, send_to) ->
      spawn(Chain, :counter, [send_to])
    end

    last = Enum.reduce(1..n, self(), code_to_run) ## self() 함수는 현재 PID를 조회

    send(last, 0) ## last는 마지막으로 생성된 프로세스의 PID, 마지막 프로세스에 0을 보내서 액터에 신호를 보내면 액터 체인이 실행될 것이다.

    receive do
      final_answer when is_integer(final_answer) ->
        "Result is #{inspect(final_answer)}"
    end
  end

  def run(n) do
    :timer.tc(Chain, :create_processes, [n]) ## :timer.tc는 얼랭 내장라이브러리를 의미하여 함수 실행시간을 측정
    |> IO.inspect
  end
end
