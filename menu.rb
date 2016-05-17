require_relative 'high_low'
require_relative 'slots'
require_relative 'player'
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
        puts "4: See bankroll/ Add funds"
        puts "5: Player menu"
        puts "6: Leave casino"

        case gets.strip
        when '1'
          @slots = Slots.new
          @slots.play(player)
        when '2'
          @high_low = HighLow.new
          @high_low.play(player)
        when '3'
          @roulette = Roulette.new
          @roulette.play(player)
        when '4'
          BankrollMenu.display(player)
        when '5'
          PlayerMenu.display(player)    
        when '6'
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
