module Menu
  class Main_menu
    def display
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
        #High/Low file
      when '3'
        #Check bankroll
      when '4'
        abort("Thanks for playing")
      end
    end
  end
end