require_relative 'high_low'
require_relative 'slots'
<<<<<<< 3e91d05c8e5bc9e9f73cf84b15d0a33ff22aedda
=======
require_relative 'player'
>>>>>>> Roulette game!
require_relative 'roulette'
require 'colorize'

module Menu

  class MainMenu
    def self.display(player)
      while true
        puts '**************'
        puts '     MENU     '
        puts '**************'
        puts "What would you like to do?"
        puts "1: Slots"
        puts "2: High/Low"
        puts "3: Roulette"
<<<<<<< 3e91d05c8e5bc9e9f73cf84b15d0a33ff22aedda
        puts "4: See bankroll/ Add funds"
        puts "5: Leave casino"
=======
        puts "4: See bankroll"
        puts "5: Switch player"
        puts "6: Leave casino"
>>>>>>> Roulette game!

        case gets.strip
        when '1'
          @slots = Slots.new
          @slots.play(player)
        when '2'
          @high_low = HighLow.new
          @high_low.play(player)
        when '3'
          @roulette = Roulette.new
<<<<<<< 3e91d05c8e5bc9e9f73cf84b15d0a33ff22aedda
          @roulette.play(player)
        when '4'
          BankrollMenu.display(player)
        when '5'
=======
          @roulette.play(player)  
        when '4'
          BankrollMenu.display(player)
        when '5'
          PlayerMenu.display(player)    
        when '6'
>>>>>>> Roulette game!
          abort("Thanks for playing")
        end
      end    
    end
  end

  class BankrollMenu
    def self.display(player)
      puts '*************'
      puts 'BANKROLL MENU'
      puts '*************'
      
      player.display_money
      puts "\nWould you like to add more funds? (y/n)"
      add_more = gets.strip.downcase
      if add_more == 'y' 
        puts 'How much money would you like to add?'
        money = gets.strip.to_f
        player.balance('+', money)
        player.display_money
        MainMenu.display(player)
      else
        MainMenu.display(player)
      end
    end
  end

  class PlayerMenu
    def self.display(player)
      puts '********************'
      puts ' SELECT YOUR PLAYER '
      puts '********************'




    end
  end
end
