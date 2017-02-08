defmodule PhoenixApi.Post do
  use PhoenixApi.Web, :model

  schema "posts" do
    field :title
    field :content

    timestamps()
  end
end
