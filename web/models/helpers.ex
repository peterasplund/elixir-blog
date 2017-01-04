defmodule Blog.Helpers do
	@moduledoc """
		Collection of helpers for the main application
	"""


  defp add_dots(input, content_length, length) do
    if content_length > length  do
      input ++ ["…"]
    else
      input
    end
  end

  defp trim_last(list) do
    List.replace_at(list, Enum.count(list), String.trim_trailing(List.last(list)))
  end

	@doc """
		Shorten html markup and add ellipsis

		## Examples
			iex> Blog.Helpers.shorten_content "lorem ipsum dolor sit amet" 3
			"lorem ipsum dolor…"
	"""
	def shorten_content(input, length \\ 10) do
    content_length = Enum.count(String.split(input, " "))
    input
    |> String.split(" ")
    |> Enum.split(length)
    |> elem(0)
    |> Enum.join(" ")
    |> String.trim_trailing
	end
end
