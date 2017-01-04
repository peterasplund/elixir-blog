defmodule Blog.HelpersTest do
  use Blog.ModelCase

  alias Blog.Helpers

  test "asdasd" do
    assert Helpers.shorten_content("lorem ipsum dolor sit amet", 3) == "lorem ipsum dolor"
  end
end
