require 'pry'
require_relative 'player'

Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file }

class High_low
	include Mechanics
	include Player


	def play
		puts 'How much would you like to bet?'
		wager = gets.strip.to_i
		first_card
		puts "Will it be high or low?"
		puts "1. High"
		puts "2. Low"

		case gets.strip
		when "1"
			first_card
			binding.pry
			if @player_card_rank > @dealer_card_rank
				puts "It's Higher!"
			elsif @player_card_rank == @dealer_card_rank
				puts "It's a Tie"
			else 
				puts "Sorry, you lost"
			end
		when "2"
			first_card
		end

	end

	def first_card
		@cards = Mechanics::Deck.new.cards.shuffle
		player_card = @cards.pop
		@player_card_rank = player_card.rank.to_i
		puts "Dealt card #{player_card.rank} of #{player_card.suit}"
	end

	def second_card
		dealer_card = @cards.pop
		@dealer_card_rank = dealer_card.rank.to_i
		puts "Dealt card #{dealer_card.rank} of #{dealer_card.suit}"

	end


end


