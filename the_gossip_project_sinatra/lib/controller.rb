require 'gossip'


class ApplicationController < Sinatra::Base #création une classe ApplicationController qui hérite (<) de la classe Sinatra::Base (toutes les fonctionnalités de base de Sinatra)

 #création d'une route qui amène sur la nouvelle view index.erb
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
 
  get '/gossips/new/' do
    erb :new_gossip  
  end

   #création d'une route qui amène sur la nouvelle view show.erb
  get '/gossips/:id/' do
    id = params['id']
    erb :show, locals: {gossip_to_show: Gossip.find(id)}
  end

  #création d'une route qui amène sur le formulaire de new_gossip.erb sur le site gossips/new
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save #crée au sauvergarde un nouvel objet Gossip
    redirect '/' #maintenant, redirige le user vers cette route
  end

end