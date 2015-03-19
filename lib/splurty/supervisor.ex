defmodule Splurty.Supervisor do
  use Supervisor

  def start_link do 
    :supervisor.start_link(__MODULE__, [])
  end

  #List of all child processes we want to supervisor to monitor with the strategy
  def init([]) do 
    #Adding repo to be sent into supervise 
    tree = [
      worker(Repo, []), 
      worker(Splurty.Endpoint, []),
    ]
    #The application now makes use of supervisor whilst using the :one_for_one
    supervise(tree, strategy: :one_for_one)
  end  
end
