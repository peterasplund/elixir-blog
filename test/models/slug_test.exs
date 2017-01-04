defmodule Blog.SlugTest do
  use Blog.ModelCase

  alias Blog.Post

  test "Generate valid slug" do
    changeset = Post.changeset(%Post{}, %{content: "a", title: "my tesT title"})
    assert changeset.changes.slug == "my-test-title"
  end
end
