require_relative 'high_low'

module Menu

  class MainMenu
    def self.display(player)
      puts "Welcome to our casino"
      puts "What would you like to do?"
      puts "1: Slots"
      puts "2: High/Low"
      puts "3: See bankroll"
      puts "4: Leave casino"

      case gets.strip
      when '1'
        #Slot file
      when '2'
        @high_low = HighLow.new
        @high_low.play(player)
      when '3'
        BankrollMenu.display(player)
      when '4'
        abort("Thanks for playing")
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
end
