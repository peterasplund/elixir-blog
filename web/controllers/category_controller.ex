import Blog.Helpers

defmodule Blog.CategoryController do
  use Blog.Web, :controller

  alias Blog.Category

  def index(conn, _params) do
    categories = Repo.all(Category)
    render conn, "index.html", categories: categories, layout: {Blog.LayoutView, "admin.html"}
  end

  def new(conn, _params) do
    changeset = Category.changeset(%Category{})
    render conn, "new.html", changeset: changeset, layout: {Blog.LayoutView, "admin.html"}
  end

  def create(conn, %{"category" => category_params}) do
    changeset = Category.changeset(%Category{}, Map.merge(category_params, %{
      "slug" => slugify Map.get(category_params, "title")
    }))

    case Repo.insert(changeset) do
      {:ok, _category} ->
        conn
        |> put_flash(:info, "Category created successfully.")
        |> redirect(to: category_path(conn, :index))
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset, layout: {Blog.LayoutView, "admin.html"}
    end
  end

  def show(conn, %{"id" => id}) do
    category = Repo.get!(Category, id)
    render conn, "show.html", category: category, layout: {Blog.LayoutView, "admin.html"}
  end

  def edit(conn, %{"id" => id}) do
    category = Repo.get!(Category, id)
    changeset = Category.changeset(category)
    render conn, "edit.html", category: category, changeset: changeset, layout: {Blog.LayoutView, "admin.html"}
  end

  def update(conn, %{"id" => id, "category" => category_params}) do
    category = Repo.get!(Category, id)

    changeset = Category.changeset(category, Map.merge(category_params, %{
      "slug" => slugify Map.get(category_params, "title")
    }))

    case Repo.update(changeset) do
      {:ok, category} ->
        conn
        |> put_flash(:info, "Category updated successfully.")
        |> redirect(to: category_path(conn, :show, category))
      {:error, changeset} ->
        render conn, "edit.html", category: category, changeset: changeset, layout: {Blog.LayoutView, "admin.html"}
    end
  end

  def delete(conn, %{"id" => id}) do
    category = Repo.get!(Category, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(category)

    conn
    |> put_flash(:info, "Category deleted successfully.")
    |> redirect(to: category_path(conn, :index))
  end
end