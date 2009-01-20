require 'rubygems'
require 'sinatra'
require 'sinatra/test/unit'
require 'locosxrails'

class LocosxrailsTest < Test::Unit::TestCase
  
  GETS = ['/', '/papers', '/schedule', '/sponsors', '/registration', '/contact', '/presenters-kit'].freeze
  
  GETS.each do |path|
    class_eval(<<-EOTEST)
      def test_get_#{ path.gsub(/\//, '').gsub('-', '_') }_page
        get_it "#{ path }"
        assert_equal 200, @response.status, "Could not get #{ path }"
      end
    EOTEST
  end

end
