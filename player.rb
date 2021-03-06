require 'colorize'
module Player
    class Person
        attr_accessor :name, :money
        def initialize
            @name = ''
            @money = 0
        end


        def gets_info
            puts 'What should we call you?'
            @name = gets.strip

            puts 'How much money do you want to start with?'
            @money = gets.strip.to_f

            puts "\n\n\n\n\nWelcome #{@name}! You have $#{@money} in chips to gamble with.\n\n"
        end

        def balance(operation, money)
 		     @money = @money.send(operation, money)
        end

        def display_money
    	   puts "You have $#{@money} to gamble"
        end

        def validate_wager(player)
            wager = gets.strip.to_f
            while wager <= 0 || wager > player.money
	            puts "Please enter a wager between 0 and #{player.money}"
	            wager = gets.strip.to_f 
        	end
        	return wager
        end 

        def keep_playing(player)
            puts 'Keep playing? (y/n)'
            next_game = gets.strip
            if next_game == 'y' && player.money != 0
                puts 'Get ready for your next bet...'
                return true
            elsif next_game == 'y' && player.money == 0
                puts "\n\nOH NO...!!!"
                puts "You have insufficient funds!\n\n"
                return false
            elsif next_game == 'n' && player.money != 0
                return false
            elsif next_game == 'n' && player.money == 0
                puts "\n\nRemember that you can add funds in the \'bankroll\' option...\n\n"
                return false
            else
                'Invalid option.'
                keep_playing(player)
            end
        end
    end
end

