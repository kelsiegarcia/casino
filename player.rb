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

            puts "Welcome #{@name}! You have $#{@money} in chips."
        end

        def balance(operation, money)
 			@money = @money.send(operation, money)
        end

        def display_money
        	puts "You have $#{@money} to gamble"
        end

    end
end
