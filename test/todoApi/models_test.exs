defmodule TodoApi.ModelsTest do
  use TodoApi.DataCase

  alias TodoApi.Models

  describe "tododos" do
    alias TodoApi.Models.Todo

    import TodoApi.ModelsFixtures

    @invalid_attrs %{completed: nil, title: nil}

    test "list_tododos/0 returns all tododos" do
      todo = todo_fixture()
      assert Models.list_tododos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Models.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      valid_attrs = %{completed: true, title: "some title"}

      assert {:ok, %Todo{} = todo} = Models.create_todo(valid_attrs)
      assert todo.completed == true
      assert todo.title == "some title"
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Models.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      update_attrs = %{completed: false, title: "some updated title"}

      assert {:ok, %Todo{} = todo} = Models.update_todo(todo, update_attrs)
      assert todo.completed == false
      assert todo.title == "some updated title"
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Models.update_todo(todo, @invalid_attrs)
      assert todo == Models.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Models.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Models.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Models.change_todo(todo)
    end
  end
end
