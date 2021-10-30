defmodule TodoApi.ModelsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TodoApi.Models` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        completed: true,
        title: "some title"
      })
      |> TodoApi.Models.create_todo()

    todo
  end
end
