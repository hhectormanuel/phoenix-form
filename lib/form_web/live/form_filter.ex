defmodule FormWeb.FormFilter do
  import Form.Content
  use FormWeb, :live_view
  import Phoenix.LiveView.Helpers

  def render(assigns) do
    ~H"""
      <form phx-submit="find">
        <div class="grid grid-cols-3 gap-4">
          <div class="...">
            <label class="block text-gray-500 font-bold md:text-center mb-1 md:mb-0 pr-4">
                  Include
            </label>
            <div class="md:flex md:items-center mb-6">
              <div class="md:w-2/3">
              <input class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" id="include" type="text" value="" name="include">
              </div>
            </div>
          </div>
          <div class="...">
            <label class="block text-gray-500 font-bold md:text-center mb-1 md:mb-0 pr-4">
                  Product name
            </label>
            <div class="md:flex md:items-center mb-6">
              <div class="md:w-2/3">
              <select name="name" id="name" class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500">
                <option value="">All</option>
                <%= for %{name: name} <- @products do %>
                  <option value={"#{name}"}><%= name %></option>
                <% end %>
              </select>
              </div>
            </div>
          </div>
          <div class="...">
            <label class="block text-gray-500 font-bold md:text-center mb-1 md:mb-0 pr-4">
                  Product code
              </label>
            <div class="md:flex md:items-center mb-6">
              <div class="md:w-2/3">
              <select name="code" id="code" class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500">
                <option value="">All</option>
                <%= for %{code: code} <- @products do %>
                  <option value={"#{code}"}><%= code %></option>
                <% end %>
              </select>
              </div>
            </div>
          </div>
          <div class="...">
            <label class="block text-gray-500 font-bold md:text-center mb-1 md:mb-0 pr-4">
                  Product amount
            </label>
            <div class="md:flex md:items-center mb-6">
              <div class="md:w-2/3">
              <select name="amount" id="amount" class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500">
                <option value="">All</option>
                <%= for %{amount: amount} <- @products do %>
                  <option value={"#{amount}"}><%= amount %></option>
                <% end %>
              </select>
              </div>
            </div>
          </div>
          <div class="...">
            <label class="block text-gray-500 font-bold md:text-center mb-1 md:mb-0 pr-4">
                  Product description
                </label>
            <div class="md:flex md:items-center mb-6">
              <div class="md:w-2/3">
              <select name="description" id="description" class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500">
                <option value="">All</option>
                <%= for %{description: description} <- @products do %>
                  <option value={"#{description}"}><%= description %></option>
                <% end %>
              </select>
              </div>
            </div>
          </div>
          <div class="...">
            <label class="block text-gray-500 font-bold md:text-center mb-1 md:mb-0 pr-4">
              Pagination
            </label>
          <div class="md:flex md:items-center mb-6">
              <div class="md:w-2/3">
              <select name="quantity" id="quantity" class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500">
                <option value="10">First 10</option>
                <option value="20">First 20</option>
                <option value="30">First 30</option>
              </select>
              </div>
            </div>
          </div>
          <div class="...">
            <div class="md:flex md:items-center">
              <div class="md:w-2/3">
                <button class="shadow bg-purple-500 hover:bg-purple-400 focus:shadow-outline focus:outline-none text-white font-bold py-2 px-4 rounded">
                  Find product/s
                </button>
              </div>
            </div>
          </div>
        </div>
      </form>
      <br>
      <div class="grid grid-cols-3 gap-4">
        <div class="...">
          <button class="shadow bg-purple-500 hover:bg-purple-400 focus:shadow-outline focus:outline-none text-white font-bold py-2 px-4 rounded" phx-click="refresh">
            Refresh product/s
          </button>
        </div>
      </div>

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
    {:ok, assign(socket, products: list_product_order())}
  end

  def handle_event("find", params, socket) do
    {:noreply, assign(socket, products: filter_product(params))}
  end

  def handle_event("refresh", _params, socket) do
    {:noreply, assign(socket, products: list_product())}
  end
end
