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
    puts """
         SSSSSSSSSSSSSSS LLLLLLLLLLL                  OOOOOOOOO     TTTTTTTTTTTTTTTTTTTTTTT   SSSSSSSSSSSSSSS 
       SS:::::::::::::::SL:::::::::L                OO:::::::::OO   T:::::::::::::::::::::T SS:::::::::::::::S
      S:::::SSSSSS::::::SL:::::::::L              OO:::::::::::::OO T:::::::::::::::::::::TS:::::SSSSSS::::::S
      S:::::S     SSSSSSSLL:::::::LL             O:::::::OOO:::::::OT:::::TT:::::::TT:::::TS:::::S     SSSSSSS
      S:::::S              L:::::L               O::::::O   O::::::OTTTTTT  T:::::T  TTTTTTS:::::S            
      S:::::S              L:::::L               O:::::O     O:::::O        T:::::T        S:::::S            
       S::::SSSS           L:::::L               O:::::O     O:::::O        T:::::T         S::::SSSS         
        SS::::::SSSSS      L:::::L               O:::::O     O:::::O        T:::::T          SS::::::SSSSS    
          SSS::::::::SS    L:::::L               O:::::O     O:::::O        T:::::T            SSS::::::::SS  
             SSSSSS::::S   L:::::L               O:::::O     O:::::O        T:::::T               SSSSSS::::S 
                  S:::::S  L:::::L               O:::::O     O:::::O        T:::::T                    S:::::S
                  S:::::S  L:::::L         LLLLLLO::::::O   O::::::O        T:::::T                    S:::::S
      SSSSSSS     S:::::SLL:::::::LLLLLLLLL:::::LO:::::::OOO:::::::O      TT:::::::TT      SSSSSSS     S:::::S
      S::::::SSSSSS:::::SL::::::::::::::::::::::L OO:::::::::::::OO       T:::::::::T      S::::::SSSSSS:::::S
      S:::::::::::::::SS L::::::::::::::::::::::L   OO:::::::::OO         T:::::::::T      S:::::::::::::::SS 
       SSSSSSSSSSSSSSS   LLLLLLLLLLLLLLLLLLLLLLLL     OOOOOOOOO           TTTTTTTTTTT       SSSSSSSSSSSSSSS   
    """.colorize(:cyan)
    
    while again
      puts 'How much would you like to bet?'
      wager = player.validate_wager(player)
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