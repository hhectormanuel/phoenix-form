defmodule Form.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:product) do
      add :name, :string
      add :code, :integer
      add :amount, :integer
      add :description, :text

      timestamps()
    end

    create index(:product, [:name])

  end
end
