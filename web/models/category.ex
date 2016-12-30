import Blog.Helpers

defmodule Blog.Category do
  use Blog.Web, :model

  schema "categories" do
    field :title, :string
    field :slug, :string

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
    |> cast(params, [:title, :slug])
    |> validate_required([:title])
    |> slugify_name
    |> unique_constraint(:slug)
  end
end
