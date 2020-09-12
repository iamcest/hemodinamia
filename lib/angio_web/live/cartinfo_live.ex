defmodule AngioWeb.CartinfoLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""

    <div>
    <h1 class="title is-1",
    phx-click="boom">The count is: <%= @val %></h1>

    <button class="button is-primary is-medium",
    phx-click="dec"> - </button>


    < document.querySelector('.label').appendChild(button);>



    """

    #############
  end

  #### render#####
  def mount(_session, socket) do
    {:ok, assign(socket, :val, 0)}
  end

  ###############
  def view(state, _session) do
    Html.div([], [
      Html.button([on: [click: {:increment, 1}]], "+"),
      Html.text(to_string(state)),
      Html.button([on: [click: {:decrement, 1}]], "-")
    ])
  end
end

### module
