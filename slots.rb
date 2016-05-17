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
    puts 'How much would you like to bet?'
    wager = gets.strip.to_f
      binding.pry
    validate_wager(wager, player)
    spin(wager, player)
    binding.pry
    keep_playing(player)
  end
  #turn into module
  def validate_wager(wager, player)
    if wager <= player.money && wager != 0
      puts "you bet #{wager}"
      return wager
    elsif wager > player.money
      puts 'Insufficient funds'
      Menu::MainMenu.display(player)
    elsif wager == 0
      puts 'You must make a real bet to play!'
      play(player)
    end
  end
  def spin(wager, player)
    if @reel[0] == @reel[1] && @reel[1] == @reel[2]
      puts "Jackpot!! You WIN!!"
      player.balance('+', wager)
      player.display_money
    else 
      puts "Sorry, you LOSE!!"
      player.balance('-', wager)
      player.display_money
    end
  end

  def keep_playing(player)
    puts 'Keep playing? (y/n)'
    next_game = gets.strip
    if next_game == 'y' && player.money != 0
      puts 'Get ready for your next bet...'
      play(player)
    elsif next_game == 'y' && player.money == 0
      puts "\n\nOH NO...!!!"
      puts "You have insufficient funds!\n\n"
      Menu::MainMenu.display(player)
    elsif next_game == 'n' && player.money != 0
      Menu::MainMenu.display(player)
    elsif next_game == 'n' && player.money == 0
      puts "\n\nRemember that you can add funds in the \'bankroll\' option...\n\n"
      Menu::MainMenu.display(player)
    else
      'Invalid option.'
      keep_playing(player)
    end
  end

end 