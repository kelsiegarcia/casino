module Player
    class Person
        attr_accessor :name, :money

        

        def initialize
            @name = ''
            @money = 3.00
        end

        def gets_info
            puts 'What should we call you?'
            @name = gets.strip

            puts 'How much money do you want to start with?'
            @money = gets.strip.to_i

            @player_one = {name: @name, bankroll: @money}

            puts "Welcome #{@player_one[:name]}! You have $#{@player_one[:bankroll]} in chips."
        end

        def bankroll_change
        end
    end
end
