defmodule Form.Content do
  import Ecto.Query, warn: false
  alias Form.Repo

  alias Form.Content.Product

  def list_product do
    Repo.all(Product)
  end

  def list_product_order do
    query = from Product,
      order_by: [asc: :id]
    Repo.all(query)
  end

  def get_product!(id), do: Repo.get!(Product, id)

  def filter_product(params) do
    condition =
      Enum.reject(params, fn {k, v} -> v == "" or k == "include" or k == "quantity" end)
      |>  Enum.map(fn {k, v} ->
            {String.to_atom(k), v}
          end)
    quantity = String.to_integer(params["quantity"])
    query = cond do
      Map.get(params, "include") == "" ->
        from u in Product,
        where: ^condition,
        limit: ^quantity
      length(condition) != 0 ->
        from u in Product,
        where: like(u.name, ^"%#{params["include"]}%"),
        where: ^condition,
        limit: ^quantity
      length(condition) == 0 ->
        from u in Product,
        where: like(u.name, ^"%#{params["include"]}%"),
        limit: ^quantity
      length(condition) == 0 and Map.get(params, "include") == "" ->
        from u in Product,
        limit: ^quantity
      end
    Repo.all(query)
  end

  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end


  def delete_Product(%Product{} = product) do
    Repo.delete(product)
  end

  def change_product(%Product{} = product, attrs \\ %{}) do
    Product.changeset(product, attrs)
  end
end
