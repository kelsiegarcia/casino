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
		puts 'How much would you like to bet?'
		wager = gets.strip.to_f

		validate_wager(wager, player)


		first_card = draw_high_low
		puts "Will it be high or low?"
		puts "1. High"
		puts "2. Low"

		case gets.strip
		when "1"
			second_card = draw_high_low
			if first_card < second_card
				puts "The dealer's card is higher! You win!"
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
		keep_playing(player)
	end

	def draw_high_low
		player_card = @cards.pop
		puts "Dealt card #{player_card.rank} of #{player_card.suit}"
		return Mechanics::Deck.rank_index.index(player_card.rank)
	end

	def validate_wager(wager, player)
		if wager <= player.money && wager != 0
			return wager
		elsif wager > player.money
			puts 'Insufficient funds'
			Menu::MainMenu.display(player)
		elsif wager == 0
			puts 'You must make a real bet to play!'
			play(player)
		end
	end	

	def keep_playing(player)
		puts 'Keep playing? (y/n)'
		case gets.strip
		when 'y'
			puts 'Get ready for your next bet...'
			play(player)
		when 'n'
			Menu::MainMenu.display(player)
		else
			'Invalid option.'
			keep_playing(player)
		end
	end
end


