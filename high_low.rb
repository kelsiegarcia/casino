require 'pry'
require_relative 'player'

Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file }

class HighLow
	include Mechanics
	include Player

	def initialize
		@cards = Mechanics::Deck.new.cards.shuffle
	end

	def play
		puts 'How much would you like to bet?'
		wager = gets.strip.to_i
		first_card = draw_high_low
		puts "Will it be high or low?"
		puts "1. High"
		puts "2. Low"

		case gets.strip
		when "1"
			second_card = draw_high_low
			if first_card > second_card
				puts "It's Higher!"
			elsif first_card == second_card
				puts "It's a Tie"
			else 
				puts "Sorry, you lost"
			end
		when "2"
			second_card = draw_high_low
			if first_card < second_card
				puts "It's Higher!"
			elsif first_card == second_card
				puts "It's a Tie"
			else 
				puts "Sorry, you lost"
			end
		end

	end

	def draw_high_low
		player_card = @cards.pop
		puts "Dealt card #{player_card.rank} of #{player_card.suit}"
		return Mechanics::Deck.rank_index.index(player_card.rank)
	end
end


