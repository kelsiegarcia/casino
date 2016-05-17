require 'pry'
require_relative 'player'

Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file }

class HighLow
	include Mechanics
	include Player

	def initialize
		@cards = Mechanics::Deck.new.cards.shuffle
	end

	def play(player)
		again = true
		while again
			puts 'How much would you like to bet?'
			wager = gets.strip.to_f
			player.validate_wager(wager, player)
			first_card = draw_high_low
			puts "Will the next card be high or low?"
			puts "1. High"
			puts "2. Low"

			case gets.strip
			when "1"
				second_card = draw_high_low
				if first_card < second_card
					puts "The dealer's card is higher! YOU WIN!!!!!"
					player.balance('+', wager)
					player.display_money
				elsif first_card == second_card
					puts "It's a Tie"
				else 
					puts "Sorry, you lost"
					player.balance('-', wager)
					player.display_money
				end
			when "2"
				second_card = draw_high_low

				if first_card > second_card
					puts "The dealer's card is lower. You win!"
					player.balance('+', wager)
					player.display_money
				elsif first_card == second_card
					puts "It's a Tie"
				else 
					puts "Sorry, you lost"
					player.balance('-', wager)
					player.display_money
				end
			end
			again = player.keep_playing(player)
		end
	end

		def draw_high_low
			player_card = @cards.pop
			puts "\n\nDEALER PLAYED: #{player_card.rank} of #{player_card.suit}\n\n"
			return Mechanics::Deck.rank_index.index(player_card.rank)
		end
end


