defmodule HelloGraphQL.User do
  use HelloGraphQL.Web, :model

  schema "users" do
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end

  def find_by_name(name) do
    HelloGraphQL.User
    |> HelloGraphQL.Repo.get_by(name: name)
  end

  def find_by_id(id) do
    HelloGraphQL.User
    |> HelloGraphQL.Repo.get(id)
  end
end
