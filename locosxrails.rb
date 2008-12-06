require 'rubygems'
require 'sinatra'

layout 'layout'


get '/' do
  erb :home 
end

get '/sponsor' do 
  erb :sponsor 
end

get '/papers' do
  erb :papers
end

get '/schedule' do
  erb :schedule
end

get '/sponsors' do
  erb :sponsors
end

get '/registration' do
  erb :registration
end

get '/contact' do
  erb :contact
end

not_found do
  "Dude! we can't find this, try again!"
end

error do
  "Something bad happened, we're investigting it."
end
