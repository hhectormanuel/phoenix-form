defmodule FormWeb.FormDbLive do
  use FormWeb, :live_view

  alias Form.Content

  def render(assigns) do
    ~H"""
    <%= if @form_update == nil do %>
      <form class="w-full max-w-sm" phx-submit="save">
        <div class="md:flex md:items-center mb-6">
          <div class="md:w-1/3">
            <label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4">
              Product name
            </label>
          </div>
          <div class="md:w-2/3">
            <input class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" id="name" type="text" value="" name="name">
          </div>
        </div>
        <div class="md:flex md:items-center mb-6">
          <div class="md:w-1/3">
            <label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4">
              Product code
            </label>
          </div>
          <div class="md:w-2/3">
            <input class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" id="code" type="text" value="" name="code">
          </div>
        </div>
        <div class="md:flex md:items-center mb-6">
          <div class="md:w-1/3">
            <label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4">
              Product amount
            </label>
          </div>
          <div class="md:w-2/3">
            <input class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" id="amount" type="number" value="" name="amount">
          </div>
        </div>
        <div class="md:flex md:items-center mb-6">
          <div class="md:w-1/3">
            <label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4">
              Product description
            </label>
          </div>
          <div class="md:w-2/3">
            <input class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" id="description" type="text" value="" name="description">
          </div>
        </div>
        <div class="md:flex md:items-center">
          <div class="md:w-1/3"></div>
          <div class="md:w-2/3">
            <button class="shadow bg-purple-500 hover:bg-purple-400 focus:shadow-outline focus:outline-none text-white font-bold py-2 px-4 rounded">
              Save product
            </button>
          </div>
        </div>
      </form>
      <% else %>
      <form class="w-full max-w-sm" phx-submit="update-product">
        <div class="md:flex md:items-center mb-6">
          <div class="md:w-1/3">
            <label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4">
              Product name
            </label>
          </div>
          <div class="md:w-2/3">
            <input class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" id="name" type="text" value={"#{@product.name}"} name="name">
          </div>
        </div>
        <div class="md:flex md:items-center mb-6">
          <div class="md:w-1/3">
            <label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4">
              Product code
            </label>
          </div>
          <div class="md:w-2/3">
            <input class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" id="code" type="text" value={"#{@product.code}"} name="code">
          </div>
        </div>
        <div class="md:flex md:items-center mb-6">
          <div class="md:w-1/3">
            <label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4">
              Product amount
            </label>
          </div>
          <div class="md:w-2/3">
            <input class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" id="amount" type="number" value={"#{@product.amount}"} name="amount">
          </div>
        </div>
        <div class="md:flex md:items-center mb-6">
          <div class="md:w-1/3">
            <label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4">
              Product description
            </label>
          </div>
          <div class="md:w-2/3">
            <input class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" id="description" type="text" value={"#{@product.description}"} name="description">
          </div>
        </div>
        <div class="md:flex md:items-center">
          <div class="md:w-1/3"></div>
          <div class="md:w-2/3">
            <button class="shadow bg-purple-500 hover:bg-purple-400 focus:shadow-outline focus:outline-none text-white font-bold py-2 px-4 rounded">
              Update product
            </button>
            <button type="button" phx-click="cancelar" class="shadow bg-purple-500 hover:bg-purple-400 focus:shadow-outline focus:outline-none text-white font-bold py-2 px-4 rounded">
              Cancelar
            </button>
          </div>
        </div>
      </form>
    <% end %>
    <br>
    <br>
    <br>



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
      <% end %>


      <br>
      <br>
      <br>


    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, form_update: nil, products: Content.list_product(), form_update: nil)}
  end

  def handle_event("save", params, socket) do
    Content.create_product(params)
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

  def handle_event("update-product", params, %{assigns: %{product: product}} = socket) do
    Content.update_product(product, params)
    {:noreply, assign(socket, form_update: nil, product: nil, products: Content.list_product())}
  end
end
