defmodule Repo do

   @moduledoc """
   
    *** conf ***
    This describes how we should connect to the database. It is saying fetch me the 
    settings from the Mix.config file (environemnt file ) 

    *** priv ***
    Defines  what folder should private ecto stuff go into.

  """


  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def conf do
    parse_url Application.get_env(:phoenix, :database)[:url]
  end

  def priv do
    app_dir(:splurty, "priv/repo")
  end
end
