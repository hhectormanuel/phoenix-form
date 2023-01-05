defmodule Form.Content.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "product" do
    field :name, :string
    field :code, :integer
    field :amount, :integer
    field :description, :string


    embeds_one :price, Price do
      field :price, :float
      field :cantidad, :integer
      field :total, Ecto.Enum, values: [:precio, :precio2, :precio3]
      field :visibility, Ecto.Enum, values: [:public, :private, :friends_only]
    end

    timestamps()
  end

  def changeset(product, attrs \\ %{}) do
    product
    |> cast(attrs, [:name, :code, :amount, :description])
    |> validate_required([:name, :code, :amount, :description])
  end

end
