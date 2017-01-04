import Blog.Helpers

defmodule Blog.Post do
  use Blog.Web, :model
  use Blog.Web, :controller

  schema "posts" do
    field :title, :string
    field :slug, :string
    field :content, :string
    field :category_id, :id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :slug, :content, :category_id])
    |> validate_required([:title, :content])
    |> slugify_by_field(:title, Blog.Post)
    |> unique_constraint(:slug)
  end
end
