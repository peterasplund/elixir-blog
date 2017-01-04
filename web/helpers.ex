defmodule Blog.Helpers do
	@moduledoc """
		Collection of helpers for the main application
	"""


  def add_dots(input, content_length, length) do
    if content_length > length  do
      input ++ ["..."]
    else
      input
    end
  end

	@doc """
		Shorten html markup and add ellipsis
	"""
	def shorten_content(input) do
    content_length = Enum.count(String.split(input, " "))
		input
    |> String.split(" ")
    |> Enum.split(10)
    |> elem(0)
    |> add_dots(content_length, 10)
    |> Enum.join(" ")
	end

	@doc """
		Shorten html markup and add ellipsis

		## Examples
			iex> Blog.Helpers.shorten_content "lorem ipsum dolor sit amet" 5
			"lorem"
	"""
	def shorten_content(input, length) do
    content_length = Enum.count(String.split(input, " "))
    input
    |> String.split(" ")
    |> Enum.split(length)
    |> elem(0)
    |> add_dots(content_length, length)
    |> Enum.join(" ")
	end
end
