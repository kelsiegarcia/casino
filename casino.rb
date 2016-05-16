require_relative 'player'

Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file }

class Casino
	include Mechanics
	include Player

	def initialize
		@player = Player::Person.new
	end

	def play
		puts 'Welcome to the casino!'
		player = Player::Person.new.gets_info
	end
end

@game = Casino.new
@game.play 



# Player enters casino
# Get player info and initial bank roll
# Choose game from menu (slots and high/low)

# Player makes bet
# Bankroll either moves up or down

