defmodule Blog.Helpers do
	@moduledoc """
		Collection of helpers for the main application
	"""

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
