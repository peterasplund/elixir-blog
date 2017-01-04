defmodule Blog.UserTest do
  use Blog.ModelCase

  alias Blog.User

  @valid_attrs %{password: "some content", email: "test@testmail.com"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end
end
