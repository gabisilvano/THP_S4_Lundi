require 'bundler'
Bundler.require
require_relative 'gossip'

class GossipProjectApp < Sinatra::Base
	i = 0
  get '/' do
    erb:index, locals: {gossips: Gossip.all}
  end
  get '/gossips/new' do
    erb:new_gossip
  end
  post '/gossips/new' do
   p "Salut, je suis dans le serveur"
   p "Ceci est mon super params : #{params}"
   p "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
   p "De la bombe, et du coup ça ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
   p "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
   Gossip.new(params["gossip_author"], params["gossip_content"]).save
   redirect '/'
   end
   get ('/gossips/:num') do
   	num = i
   	a = Gossip.all
   	@name = a[i-1]
   	@text = a[i]
   	p @name
   	erb:pots_gossip   
   end

#  run! if app_file == $0
end