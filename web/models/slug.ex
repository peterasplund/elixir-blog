defmodule Blog.Slug do
  use Blog.Web, :model

  alias Blog.Repo

  @doc """
    Slugify url
  """
  defp slugify(input) do
    input
    |> String.downcase()
    |> String.replace(~r/[^\w-]+/, "-")
  end

  defp find_available_slug(slug, model, i) do
    case Repo.get_by(model, slug: slug <> to_string i) do
      nil -> slug <> to_string i
      record -> find_available_slug(slug, model, i + 1)
    end
  end

  defp find_available_slug(slug, model) do
    case Repo.get_by(model, slug: slug) do
      nil -> slug
      record -> find_available_slug(slug, model, 1)
    end
  end

  @doc """
    Slugifies field `slug` on changeset by the passed `field`s value.
  """
  def slugify_by_field(changeset, field, model) do
    if title = get_change(changeset, field) do
      put_change(changeset, :slug, find_available_slug(slugify(title), model))
    else
      changeset
    end
  end
end
