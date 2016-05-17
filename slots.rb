require 'pry'
require_relative 'player'

Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file }

class Slots
	include Mechanics
	include Player
  
  def initialize
    @reel = Mechanics::Slots.spin
  end

  def play(player)
    again = true
    while again
      puts 'How much would you like to bet?'
      wager = gets.strip.to_f
      player.validate_wager(wager, player)
      spin(wager, player)
      again = player.keep_playing(player)
    end
  end

  def spin(wager, player)
    if @reel[0] == @reel[1] && @reel[1] == @reel[2]
      puts "#{@reel}"
      puts "Jackpot!! You WIN!!"
      player.balance('+', 5 * wager)
      player.display_money
    else 
      	puts "#{@reel}"
        puts "Sorry, you LOSE!!"
      	player.balance('-', wager)
      	player.display_money
    end
  end

end 