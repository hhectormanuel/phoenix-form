defmodule FormWeb.FormLive do


  use FormWeb, :live_view

  require Logger
  def render(assigns) do
    ~H"""
    <h1><%= @name %></h1>
    <%= if @form_update == nil do %>
      <form class="w-full max-w-sm" phx-submit="save">
        <div class="md:flex md:items-center mb-6">
          <div class="md:w-1/3">
            <label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4">
              Product name
            </label>
          </div>
          <div class="md:w-2/3">
            <input class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" id="propduct_name" type="text" value="" name="product_name">
          </div>
        </div>
        <div class="md:flex md:items-center mb-6">
          <div class="md:w-1/3">
            <label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4">
              Product code
            </label>
          </div>
          <div class="md:w-2/3">
            <input class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" id="product_code" type="text" value="" name="product_code">
          </div>
        </div>
        <div class="md:flex md:items-center mb-6">
          <div class="md:w-1/3">
            <label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4">
              Product amount
            </label>
          </div>
          <div class="md:w-2/3">
            <input class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" id="product_amount" type="number" value="" name="product_amount">
          </div>
        </div>
        <div class="md:flex md:items-center mb-6">
          <div class="md:w-1/3">
            <label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4">
              Product description
            </label>
          </div>
          <div class="md:w-2/3">
            <input class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" id="product_description" type="text" value="" name="product_description">
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
            <input class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" id="propduct_name" type="text" value={"#{@product["product_name"]}"} name="product_name">
          </div>
        </div>
        <div class="md:flex md:items-center mb-6">
          <div class="md:w-1/3">
            <label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4">
              Product code
            </label>
          </div>
          <div class="md:w-2/3">
            <input class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" id="product_code" type="text" value={"#{@product["product_code"]}"} name="product_code">
          </div>
        </div>
        <div class="md:flex md:items-center mb-6">
          <div class="md:w-1/3">
            <label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4">
              Product amount
            </label>
          </div>
          <div class="md:w-2/3">
            <input class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" id="product_amount" type="number" value={"#{@product["product_amount"]}"} name="product_amount">
          </div>
        </div>
        <div class="md:flex md:items-center mb-6">
          <div class="md:w-1/3">
            <label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4">
              Product description
            </label>
          </div>
          <div class="md:w-2/3">
            <input class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" id="product_description" type="text" value={"#{@product["product_description"]}"} name="product_description">
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

    <button class="shadow bg-purple-500 hover:bg-purple-400 focus:shadow-outline focus:outline-none text-white font-bold py-2 px-4 rounded" phx-click="name">
    Change name
    </button>
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
          <td><%= product["product_id"] %></td>
          <td><%= product["product_name"] %></td>
          <td><%= product["product_amount"] %></td>
          <td><%= product["product_code"] %></td>
          <td><button phx-click="actualizar" class="bg-red-500" phx-value-id={"#{product["product_id"]}"}>Actualizar</button></td>
          <td><button phx-click="eliminar" phx-value-id={"#{product["product_id"]}"} class="bg-blue-500">Eliminar</button></td>
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
    products = [%{"product_id" => 1,"product_name" => "agua", "product_amount" => 12, "product_code" => "agua natural del 600 ml"
    }, %{"product_id" => 2,"product_name" => "sabritas", "product_amount" => 10, "product_code" => "papas naturales sabor habanero"}]
    {:ok, assign(socket, name: "hector", products: products, form_update: nil)}
    # , changeset: Product.changeset(%Product{})
  end

  def handle_event("actualizar", %{"id" => id} = _params, %{assigns: %{products: products}} = socket) do
    [product_to_update] = Enum.filter(products, fn x -> "#{x["product_id"]}" == id end)
    {:noreply, assign(socket, name: "hector 2", product: product_to_update , form_update: true)}
  end

  def handle_event("cancelar", _params, socket) do
    {:noreply, assign(socket, name: "hector 4", form_update: nil)}
  end

  def handle_event("update-product", params,
    %{assigns:
      %{products: products,
      product: product
    }} = socket) do
    products = products -- [product]
    products =
      [Map.merge(params, %{"product_id" => product["product_id"]})] ++ products
      |> Enum.sort(&(&1["product_id"] <= &2["product_id"]))
    {:noreply, assign(socket, name: "hector3", products: products, form_update: nil)}
  end

  def handle_event("name", _value, socket) do
    {:noreply, redirect(socket, to: "/")}
  end

  def handle_event("validate",
  %{"product_name" => name,
  "product_amount" => amount,
  "product_code" => description
  } = _params,
  socket) do
    # "product_description" => product_description
    # if name == "" do
    #   Logger.error("No es valido")
    # else
    #   Logger.info("Valido")
    # end

    # if description == "" do
    #   Logger.error("No es valido")
    # else
    #   Logger.info("Valido")
    # end

    # if amount == "" do
    #   Logger.error("No es valido")
    # else
    #   Logger.info("Valido")
    # end

    message =
      if name == "" or description == "" or amount == "" do
        message = "Completar los campos"
        Logger.error(message)
        message
      else
        message = "Formulario completado"
        Logger.info(message)
        message
      end


    {:noreply, assign(socket, message: message)}
  end

  def handle_event("eliminar", %{"id" => id} = _params, %{assigns: %{products: products}} = socket) do
    delete = Enum.filter(products, fn x -> "#{x["product_id"]}" == id end)
    products = products -- delete
    {:noreply, assign(socket, name: "hector 2", products: products)}
  end



  def handle_event("save", %{"product_name" => name,
    "product_amount" => amount,
    "product_code" => code,
    "product_description" => description
    }= _params, %{assigns: %{products: products}} = socket) do

    # alias Form.Content.Product
    # alias Form.Repo
    # attrs = %{name: name, code: code, amount: amount, description: description}
    # Product.changeset(%Product{}, attrs)
    # |> Repo.insert()
    # alias Form.Content.Product
    # productos = Form.Repo.all(Product)

    id =
      if length(products) == 0 do
        0
      else
        Enum.map(products, fn x -> x["product_id"] end)
        |> Enum.max()
    end


    product = %{"product_id" => id + 1, "product_name" => name, "product_amount" => amount, "product_code" => code, "product_description" => description}
    products = products ++ [product]
    {:noreply, assign(socket, name: "juan", products: products)}
  end


end


# <.form let={f} for={@changeset}>
#       <%= text_input f, :name %>
#       <%= text_input f, :code %>
#       <%= text_input f, :amount %>
#       <%= text_input f, :description %>
#       <%= submit "Save Product" %>
# </.form>
