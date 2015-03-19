defmodule Splurty.QuoteController do

  @moduledoc """
    All controller actions take two arguments.
    1) conn: hiold inofrmation about the request 
    2) params: request params. To avoid the compiler warnings add a underscore
       before the word params (_params) 
  """
  use Phoenix.Controller
  alias Splurty.Router
  import Splurty.Router.Helpers

  #Plug action is is allowing are controllers respond to actions
  plug :action
  
  def homepage(conn, _params) do 
    conn 
    |> assign(:quote, Splurty.Quote.Queries.random)
    |> render("show.html")
    #render conn, "homepage.html"
  end

  def index(conn, _params) do
    conn
    |> assign(:quotes, Repo.all(Splurty.Quote))
    |> render("index.html")
  end

  def new(conn, _params) do 
    render conn, "new.html"
  end

  @doc """
    Here we pattern match against the params passed into the create function. 
    We bind the variable saying to the value of saying and the same for author

    redirect conn, to: path_name(conn, :action)
  """
  def create(conn, %{"quote" => %{"saying" => saying, "author" => author}}) do 
    q = %Splurty.Quote{saying: saying, author: author}
    Repo.insert(q)

    redirect conn, to: quote_path(conn, :index)
  end

  def show(conn, %{"id" => id}) do 
    {id, _} = Integer.parse(id)
    conn
    |> assign(:quote, Repo.get(Splurty.Quote, id))
    |> render("show.html")
    
  end

  def edit(conn, %{"id" => id}) do 
    {id, _} = Integer.parse(id)
    conn 
    |> assign(:quote, Repo.get(Splurty.Quote, id))
    |> render("edit.html") 
  end

  def update(conn, %{"id" => id, "quote" => %{"saying" => saying, "author" => author}}) do 
    {id, _} = Integer.parse(id)
    q = Repo.get(Splurty.Quote, id)
    q = %{q | saying: saying, author: author}
    Repo.update(q)
    redirect conn, to: quote_path(conn, :show, q.id)
  end

  def destroy(conn, %{"id" => id}) do 
    {id, _} = Integer.parse(id)
    q = Repo.get(Splurty.Quote, id)
    Repo.delete(q)
    redirect conn, to: quote_path(conn, :index)
  end
end
