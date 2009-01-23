require 'rubygems'
require 'sinatra'

Sinatra::Application.set(
   :run => false,
   :environment => :production,
   :views => File.join(File.dirname(__FILE__), 'views')
)

require 'locosxrails.rb'
run Sinatra::Application

