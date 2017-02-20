defmodule PhoenixApi.PostController do
  use PhoenixApi.Web, :controller

  alias PhoenixApi.Post

  def index(conn, _params) do
    posts = Repo.all(Post)
    render conn, "index.json", posts: posts
  end

  def show(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)
    render(conn, "show.json", post: post)
  end

  def create(conn, %{"post" => post_params}) do
    changeset = Post.changeset(%Post{}, post_params)

    case Repo.insert(changeset) do
      {:ok, _post} ->
        conn
        |> redirect(to: post_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
