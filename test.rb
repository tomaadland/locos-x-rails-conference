require 'rubygems'
require 'sinatra'
require 'sinatra/test/unit'
require 'locosxrails'

class LocosxrailsTest < Test::Unit::TestCase
  
  GETS = ['/', '/papers', '/schedule', '/sponsors', '/registration', '/contact'].freeze
  
  def test_all_gets
    GETS.each do |path|
      get_it path
      assert_equal 200, @response.status, "Could not get #{path}"
    end
  end

end