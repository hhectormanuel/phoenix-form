defmodule Form.Content.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "product" do
    field :name, :string
    field :code, :integer
    field :amount, :integer
    field :description, :string

    timestamps()
  end

  def changeset(product, attrs \\ %{}) do
    product
    |> cast(attrs, [:name, :code, :amount, :description])
    |> validate_required([:name, :code, :amount, :description])
  end

end
