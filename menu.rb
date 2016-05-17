require_relative 'high_low'


module Menu

  class Main_menu
    def self.display(player)
      puts "Welcome to our casino"
      puts "What would you like to do?"
      puts "1: Slots"
      puts "2: High/Low"
      puts "3: Check bankroll"
      puts "4: Leave casino"

      case gets.strip
      when '1'
        #Slot file
      when '2'
        @high_low = HighLow.new
        @high_low.play(player)
      when '3'
        puts 'This will check the bankroll'
      when '4'
        abort("Thanks for playing")
      end
    end
  end
end
