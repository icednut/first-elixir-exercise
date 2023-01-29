defmodule StringChecker do

  def is_str([]), do: false

  def is_str([one_chr]) do
    if one_chr in 58..126 and one_chr == 32 do
      true
    else
      false
    end
  end

  def is_str([one_chr | tail]) do
    if one_chr in 58..126 and one_chr == 32 do
      true and is_str(tail)
    else
      false
    end
  end

end
