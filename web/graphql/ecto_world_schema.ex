defmodule GraphQL.Schema.EctoWorld do
  alias GraphQL.Schema
  alias GraphQL.Type.{ID, ObjectType, String}
  alias HelloGraphQL.{User, Repo}

  def schema do
    %Schema{
      query: %ObjectType{
        name: "EctoWorld",
        fields: %{
          greeting: %{
            type: %String{},
            args: %{
              id: %{type: %ID{}},
              name: %{type: %String{}},
            },
            resolve: {Schema.EctoWorld, :greeting}
          }
        }
      }
    }
  end

  def greeting(_source, %{name: name}, _info) do
    User
    |> Repo.get_by!(name: name)
    |> greeting_message
  end

  def greeting(_source, %{id: id}, _info) do
    User
    |> Repo.get!(id)
    |> greeting_message
  end

  def greeting(_source, _args, _info), do: greeting_message("world")

  defp greeting_message(%User{name: name}), do: greeting_message(name)

  defp greeting_message(name) do
    "Hello, #{name}!"
  end
end
