import Blog.Helpers

defmodule Blog.Post do
  use Blog.Web, :model

  schema "posts" do
    field :title, :string
    field :slug, :string
    field :content, :string
    field :category_id, :id

    timestamps()
  end

  defp slugify_name(changeset) do  
    if title = get_change(changeset, :title) do
      put_change(changeset, :slug, slugify(title))
    else
      changeset
    end
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :slug, :content, :category_id])
    |> validate_required([:title, :content])
    |> slugify_name
    |> unique_constraint(:slug)
  end
end
