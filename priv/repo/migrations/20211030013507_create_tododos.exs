defmodule TodoApi.Repo.Migrations.CreateTododos do
  use Ecto.Migration

  def change do
    create table(:tododos) do
      add :title, :string
      add :completed, :boolean, default: false, null: false

      timestamps()
    end
  end
end
