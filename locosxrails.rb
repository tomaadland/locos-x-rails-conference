require 'rubygems'
require 'sinatra'
require 'digest/md5'

# Local extra helper lib..
require 'ext_helpers'
# Localization functions
require 'l18n'
include L18n

class Rack::Lint::ErrorWrapper
  alias_method :<<, :write unless instance_methods.include?(:<<) # strange rack or sinatra error, don't know why this is needed.
end

layout 'layout'

helpers do

  def s(key)
    get_string(key)
  end

  def gravatar_url(email)
    unless email.blank?
      hash = Digest::MD5.hexdigest(email)
      image = "http://www.gravatar.com/avatar/#{hash}"
    else
      image = "http://simplepie.org/blog/wp-content/gravatars/default_gravatar.png"
    end
  end

  # Ok, nobody accuse me of being an imperialist Yankee or Limey or Pom or
  # whatever. Let's put all the major EN flags up there. Shuffle is weighted
  # towards US and GB though... just because.
  def random_flag
    ['au', 'ca', 'gb', 'gb', 'gb', 'nz', 'us', 'us', 'us'].sort { rand <=> rand }.first
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

get '/presenters-kit' do
  erb :presenters_kit
end

not_found do
  "Dude! we can't find this, try again!"
end

#error do
#  "Something bad happened, we're investigting it."
#end
