require 'rubygems'
require 'sinatra'

Sinatra::Application.default_options.merge!(
   :run => false,
   :env => :production,
   :views => File.join(File.dirname(__FILE__), 'views')
)

require 'locosxrails.rb'
run Sinatra.application

