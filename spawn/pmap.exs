defmodule Parallel do
  import :timer, only: [sleep: 1]

  def pmap(collection, fun) do
    me = self()

    collection
    |> Enum.map(fn (elem) ->
      current_pid = spawn_link(fn ->
        child_pid = self()
        IO.puts "여긴 자식 프로세스 입니다. me = #{inspect me}, child_pid = #{inspect child_pid}"
        (send me, {child_pid, fun.(elem)})
      end)

      IO.puts "프로세스 생성 완료! 생성된 자식 프로세스 = #{inspect current_pid}"
      current_pid
    end)
    |> Enum.map(fn (pid) ->
      receive do
        {_pid, result} ->
          IO.puts "여기는 부모 프로세스 입니다. pid = #{inspect pid} _pid = #{inspect _pid}, self = #{inspect self()}, result = #{result}"
          result
      end
    end)
  end

end
