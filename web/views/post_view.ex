defmodule PhoenixApi.PostView do
  use PhoenixApi.Web, :view

  def render("index.json", %{posts: posts}) do
    %{
      posts: Enum.map(posts, &post_json/1)
    }
  end

  def render("show.json", %{post: post}) do
    %{post: post_json(post)}
  end

  def post_json(post) do
    %{
      title: post.title,
      content: post.content,
      inserted_at: post.inserted_at,
      updated_at: post.updated_at
    }
  end

end
