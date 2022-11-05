defmodule ListFilter do
  def call(list) do
    if(Enum.any?(list) == is_integer(list) or is_reference(list)) do
      {:error, "Its Wrong"}
    else
      # case(String.length(list, fn x -> (x > 0) end)), do: {:error, "Has an text on your List"}
      # case(Enum.any?(list, &is_integer/1)), do: {:error, "Has an Integer on your List"}
      # case(is_bitstring(list)) do
      {
        :ok,
        list
        # This filter will select only the strings that has numbers
        |> Enum.filter(&(&1 =~ ~r/^\-?\d+$/))
        |> Enum.map(&String.to_integer/1)
        |> Enum.filter(&(rem(&1, 2) == 1))
        |> Enum.count()
      }
    end
  end
end
