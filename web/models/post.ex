defmodule PhoenixApi.Post do
  use PhoenixApi.Web, :model

  schema "posts" do
    field :title
    field :content

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :content])
    |> validate_required([:title, :content])
  end
end
