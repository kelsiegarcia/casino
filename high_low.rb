require_relative 'player'

Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file }

class High_low
	include Mechanics
	include Player


	def play
		puts 'How much would you like to bet?'
		wager = gets.strip.to_i

	end

	# def deal_card
	# 	cards = Mechanics::Deck.new
	# 	puts cards.generate_deck

	# end
end

