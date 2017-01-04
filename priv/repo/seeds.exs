alias Blog.Repo
alias Blog.Category
alias Blog.Post

# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Blog.Repo.insert!(%Blog.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

#use Ecto.Migration

#Ecto.drop Ecto.table(:posts)
#Ecto.drop Ecto.table(:categories)

Repo.insert!(Category.changeset(%Category{}, %{title: "Javascript"}))
Repo.insert!(Category.changeset(%Category{}, %{title: "PHP"}))
Repo.insert!(Category.changeset(%Category{}, %{title: "Elixir"}))
Repo.insert!(Category.changeset(%Category{}, %{title: "Miscellaneous"}))

Repo.insert!(Post.changeset(%Post{}, %{
  title: "My dummy blog post #1",
  content: "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p><p>Blanditiis ipsum sunt fuga, ipsam officiis magni, dolore enim, est sit hic voluptas odit nesciunt saepe veritatis vitae nemo tenetur. Fugiat, quasi!</p>",
  category_id: 2
}))
Repo.insert!(Post.changeset(%Post{}, %{
  title: "My dummy blog post #2",
  content: "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p><p>Blanditiis ipsum sunt fuga, ipsam officiis magni, dolore enim, est sit hic voluptas odit nesciunt saepe veritatis vitae nemo tenetur. Fugiat, quasi!</p>",
  category_id: 4
}))
Repo.insert!(Post.changeset(%Post{}, %{
  title: "My dummy blog post #3",
  content: "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p><p>Blanditiis ipsum sunt fuga, ipsam officiis magni, dolore enim, est sit hic voluptas odit nesciunt saepe veritatis vitae nemo tenetur. Fugiat, quasi!</p>",
  category_id: 4
}))
Repo.insert!(Post.changeset(%Post{}, %{
  title: "My dummy blog post #4",
  content: "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p><p>Blanditiis ipsum sunt fuga, ipsam officiis magni, dolore enim, est sit hic voluptas odit nesciunt saepe veritatis vitae nemo tenetur. Fugiat, quasi!</p>",
  category_id: 3
}))
Repo.insert!(Post.changeset(%Post{}, %{
  title: "Two posts with the same name to create a slug collision",
  content: "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p><p>Blanditiis ipsum sunt fuga, ipsam officiis magni, dolore enim, est sit hic voluptas odit nesciunt saepe veritatis vitae nemo tenetur. Fugiat, quasi!</p>",
  category_id: 3
}))
Repo.insert!(Post.changeset(%Post{}, %{
  title: "Two posts with the same name to create a slug collision",
  content: "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p><p>Blanditiis ipsum sunt fuga, ipsam officiis magni, dolore enim, est sit hic voluptas odit nesciunt saepe veritatis vitae nemo tenetur. Fugiat, quasi!</p>",
  category_id: 3
}))
