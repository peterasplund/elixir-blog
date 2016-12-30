defmodule Blog.Helpers do
	@moduledoc """
		Collection of helpers for the main application
	"""

	@doc """
		Slugify url
	"""
	def slugify(input) do
		input
		|> String.downcase()
		|> String.replace(" ", "-")
	end
end