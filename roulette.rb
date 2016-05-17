require 'pry'
require_relative 'player'
Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file }

class Roulette
  include Mechanics
  include Player

  def initialize
    @spin = Mechanics::Roulette.roll
  end

  def play(player)
    again = true
    while again
    puts 'How much would you like to bet?'
    wager = gets.strip.to_f
    player.validate_wager(wager, player)
    puts "Pick a number 1 through 30"
    picked_number = gets.strip.to_i
    puts "#{@spin}"
    if @spin == picked_number
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