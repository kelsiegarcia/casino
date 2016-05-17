require 'pry'
require_relative 'player'
require 'colorize'
Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file }

class Roulette
  include Mechanics
  include Player

  def initialize
    @spin = Mechanics::Roulette.roll
  end

  def play(player)
    again = true
    puts """
      _____     ____    _    _   _        ______   _______   _______   ______ 
     |  __     / __    | |  | | | |      |  ____| |__   __| |__   __| |  ____|
     | |__) | | |  | | | |  | | | |      | |__       | |       | |    | |__   
     |  _  /  | |  | | | |  | | | |      |  __|      | |       | |    |  __|  
     | | | |  | |__| | | |__| | | |____  | |____     | |       | |    | |____ 
     |_| |_|    ____/    ____/  |______| |______|    |_|       |_|    |______|
     """.colorize(:red)
    while again
    puts 'How much would you like to bet?'
    wager = player.validate_wager(player)
    puts "Pick a number 1 through 30"
    picked_number = gets.strip.to_i
    puts "#{@spin}"

    if @spin[0] == picked_number
      puts "You Win!!"
      player.balance('+', 30 * wager)
      player.display_money
    else 
      puts "Sorry, you lose"
      player.balance('-', wager)
      player.display_money      
    end
    again = player.keep_playing(player)
  end
  end
end