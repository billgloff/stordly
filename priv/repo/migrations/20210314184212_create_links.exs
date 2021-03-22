defmodule Stordly.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :url, :text, null: false
      add :slug, :string, size: 50, null: false

      timestamps(updated_at: false)
    end

    create unique_index(:links, [:url])
    create unique_index(:links, [:slug])
  end
end
