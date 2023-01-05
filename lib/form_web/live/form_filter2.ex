defmodule FormWeb.FormFilter2 do
  use FormWeb, :live_view
  alias Form.Content


  def render(assigns) do
    ~H"""
    <%= if @form_update == nil do %>
      <.form let={f} for={@changeset} phx-submit="save">
      <div class="grid grid-cols-3 gap-4">
            <div class="...">
              <label class="block text-gray-500 font-bold md:text-center mb-1 md:mb-0 pr-4">
                    Product name
              </label>
              <div class="md:flex md:items-center mb-6">
                <div class="md:w-2/3">
                <%= text_input f, :name,
                class: "bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500"
                %>
                </div>
              </div>
            </div>
            <div class="...">
              <label class="block text-gray-500 font-bold md:text-center mb-1 md:mb-0 pr-4">
                    Product code
              </label>
              <div class="md:flex md:items-center mb-6">
                <div class="md:w-2/3">
                <%= text_input f, :code,
                class: "bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500"
                %>
                </div>
              </div>
            </div>
            <div class="...">
              <label class="block text-gray-500 font-bold md:text-center mb-1 md:mb-0 pr-4">
                    Product amount
              </label>
              <div class="md:flex md:items-center mb-6">
                <div class="md:w-2/3">
                <%= text_input f, :amount,
                class: "bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500"
                %>
                </div>
              </div>
            </div>
            <div class="...">
              <label class="block text-gray-500 font-bold md:text-center mb-1 md:mb-0 pr-4">
                    Product description
              </label>
              <div class="md:flex md:items-center mb-6">
                <div class="md:w-2/3">
                <%= text_input f, :description,
                class: "bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500"
                %>
                </div>
              </div>
            </div>
            <div class="...">
              <div class="md:flex md:items-center">
                <div class="md:w-2/3">
                <%= submit "Save product",
                  class: "shadow bg-purple-500 hover:bg-purple-400 focus:shadow-outline focus:outline-none text-white font-bold py-2 px-4 rounded"
                %>
                </div>
              </div>
            </div>
          </div>
        </.form>
    <% else %>
      <.form let={f} for={@changeset} phx-submit="update-product">
        <div class="grid grid-cols-3 gap-4">
              <div class="...">
                <label class="block text-gray-500 font-bold md:text-center mb-1 md:mb-0 pr-4">
                      Product name
                </label>
                <div class="md:flex md:items-center mb-6">
                  <div class="md:w-2/3">
                  <%= text_input f, :name,
                  value: @product.name,
                  class: "bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500"
                  %>
                  </div>
                </div>
              </div>
              <div class="...">
                <label class="block text-gray-500 font-bold md:text-center mb-1 md:mb-0 pr-4">
                      Product code
                </label>
                <div class="md:flex md:items-center mb-6">
                  <div class="md:w-2/3">
                  <%= number_input f, :code,
                  value: @product.code,
                  class: "bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500"
                  %>
                  </div>
                </div>
              </div>
              <div class="...">
                <label class="block text-gray-500 font-bold md:text-center mb-1 md:mb-0 pr-4">
                      Product amount
                </label>
                <div class="md:flex md:items-center mb-6">
                  <div class="md:w-2/3">
                  <%= number_input f, :amount,
                  value: @product.amount,
                  class: "bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500"
                  %>
                  </div>
                </div>
              </div>
              <div class="...">
                <label class="block text-gray-500 font-bold md:text-center mb-1 md:mb-0 pr-4">
                      Product description
                </label>
                <div class="md:flex md:items-center mb-6">
                  <div class="md:w-2/3">
                  <%= text_input f, :description,
                  value: @product.description,
                  class: "bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500"
                  %>
                  </div>
                </div>
              </div>
              <div class="...">
                <div class="md:flex md:items-center">
                  <div class="md:w-2/3">
                  <%= submit "Update product",
                    class: "shadow bg-purple-500 hover:bg-purple-400 focus:shadow-outline focus:outline-none text-white font-bold py-2 px-4 rounded"
                  %>
                  </div>
                </div>
              </div>
            </div>
      </.form>
      <br>
      <button type="button" phx-click="cancelar" class="shadow bg-purple-500 hover:bg-purple-400 focus:shadow-outline focus:outline-none text-white font-bold py-2 px-4 rounded">
        Cancelar
      </button>
      <% end %>

        <%= if length(@products) > 0 do %>
        <table class="table-auto">
          <tr>
            <td>Product Id</td>
            <td>Product Name</td>
            <td>Product Amount</td>
            <td>Product Code</td>
          </tr>
          <%= for product <- @products do %>
          <tr>
            <td><%= product.id%></td>
            <td><%= product.name%></td>
            <td><%= product.amount%></td>
            <td><%= product.code%></td>
            <td><button phx-click="actualizar" class="bg-red-500" phx-value-id={"#{product.id}"}>Actualizar</button></td>
            <td><button phx-click="eliminar" phx-value-id={"#{product.id}"} class="bg-blue-500">Eliminar</button></td>
          </tr>
          <% end %>
        </table>
      <% else %>
      <br>
      <br>
      no hay productos con esas condiciones
      <% end %>



    """
  end

  def mount(_params, _session, socket) do
    alias Form.Content.Product
    changeset = Product.changeset(%Product{})
    {:ok, assign(socket, changeset: changeset, products: Content.list_product_order(), form_update: nil)}
  end

  def handle_event("save",%{"product" => product} = _params, socket) do
    Content.create_product(product)
    {:noreply, assign(socket, products: Content.list_product())}
  end

  def handle_event("eliminar", %{"id" => id} = _params, socket) do
    Content.get_product!(id)
    |> Content.delete_Product()
    {:noreply, assign(socket, products: Content.list_product())}
  end

  def handle_event("cancelar", _params, socket) do
    {:noreply, assign(socket, form_update: nil)}
  end

  def handle_event("actualizar", %{"id" => id} = _params, socket) do
    {:noreply, assign(socket, product: Content.get_product!(id) , form_update: true)}
  end

  def handle_event("update-product", params, %{assigns: %{product: product_to_update}} = socket) do
    Content.update_product(product_to_update, params["product"])
    {:noreply, assign(socket, form_update: nil, product: nil, products: Content.list_product())}
  end
end
