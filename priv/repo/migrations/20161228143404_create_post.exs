defmodule Blog.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :slug, :string
      add :content, :string, size: 1000
      add :category_id, references(:categories)

      timestamps()
    end

  end
end
