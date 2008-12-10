require 'rubygems'
require 'sinatra'
require 'digest/md5'

# Local extra helper lib..
require 'ext_helpers'

layout 'layout'

helpers do

  def gravatar_url(email)
    unless email.blank?
      hash = Digest::MD5.hexdigest(email)
      image = "http://www.gravatar.com/avatar/#{hash}"
    else
      image = "http://simplepie.org/blog/wp-content/gravatars/default_gravatar.png"
    end
  end
  
end

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

#error do
#  "Something bad happened, we're investigting it."
#end
