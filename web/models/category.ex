defmodule Blog.Category do
  use Blog.Web, :model

  schema "categories" do
    field :title, :string
    field :slug, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :slug])
    |> validate_required([:title, :slug])
  end
end
