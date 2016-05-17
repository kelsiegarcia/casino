require 'pry'
require_relative 'player'

Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file }

class Slots
	include Mechanics
	include Player


end 