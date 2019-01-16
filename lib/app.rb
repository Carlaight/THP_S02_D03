# test du prog avec pry
require 'pry'
# ligne très importante qui appelle la gem.
require 'twitter'
 # Appelle la gem Dotenv
require 'dotenv'

Dotenv.load # Ceci appelle le fichier .env grâce à la gem Dotenv, et importe toutes les données enregistrées dans un hash ENV

 # quelques lignes qui appellent les clés d'API de ton fichier .env afin de se connecter
def login_twitter
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_API_KEY"]
    config.consumer_secret     = ENV["TWITTER_API_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end
   return client
end

tweet = login_twitter
# ligne qui permet de tweeter sur ton compte

tweet.update('Ça tweet en ruby au calme! #BonjourMonde!')
