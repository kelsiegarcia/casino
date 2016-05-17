require 'pry'
require_relative 'high_low'
require_relative 'slots'
require_relative 'player'
require_relative 'roulette'
require 'colorize'

Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file }

class Casino
    include Player

    def initialize
        @players = []
        @current_player = Player::Person.new
        @players << @current_player
    end

    def play
        puts """
       _  _  _                 _                _  _  _  _            _  _  _           _           _          _  _  _  _     
    _ (_)(_)(_) _            _(_)_            _(_)(_)(_)(_)_         (_)(_)(_)         (_) _       (_)       _(_)(_)(_)(_)_   
   (_)         (_)         _(_) (_)_         (_)          (_)           (_)            (_)(_)_     (_)      (_)          (_)  
   (_)                   _(_)     (_)_       (_)_  _  _  _              (_)            (_)  (_)_   (_)      (_)          (_)  
   (_)                  (_) _  _  _ (_)        (_)(_)(_)(_)_            (_)            (_)    (_)_ (_)      (_)          (_)  
   (_)          _       (_)(_)(_)(_)(_)       _           (_)           (_)            (_)      (_)(_)      (_)          (_)  
   (_) _  _  _ (_)      (_)         (_)      (_)_  _  _  _(_)         _ (_) _          (_)         (_)      (_)_  _  _  _(_)  
      (_)(_)(_)         (_)         (_)        (_)(_)(_)(_)          (_)(_)(_)         (_)         (_)        (_)(_)(_)(_)  


        """.colorize(:green)
        @current_player.gets_info
        main_menu
    end


    def main_menu
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
        puts "6: CASH OUT!"

        if @current_player.money > 0
	        case gets.strip
	        when '1'
	          @slots = Slots.new
	          @slots.play(@current_player)
	        when '2'
	          @high_low = HighLow.new
	          @high_low.play(@current_player)
	        when '3'
	          @roulette = Roulette.new
	          @roulette.play(@current_player)
	        when '4'
	          bankroll_menu
	        when '5'
	          player_menu
	        when '6'
	          abort("""
 ██████╗ █████╗ ███████╗██╗  ██╗     ██████╗ ██╗   ██╗████████╗
██╔════╝██╔══██╗██╔════╝██║  ██║    ██╔═══██╗██║   ██║╚══██╔══╝
██║     ███████║███████╗███████║    ██║   ██║██║   ██║   ██║   
██║     ██╔══██║╚════██║██╔══██║    ██║   ██║██║   ██║   ██║   
╚██████╗██║  ██║███████║██║  ██║    ╚██████╔╝╚██████╔╝   ██║   
 ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝     ╚═════╝  ╚═════╝    ╚═╝   
 	          	""")
	        end
	    else
	    	gets.strip

	    	while @current_player.money <= 0
	    		puts 'No available funds. Select option 4 to add more'
	    		bankroll_menu if gets.strip.to_i == 4 
	    	end
	    	
	    end	
      end    
    end

    def bankroll_menu
      puts '*************'
      puts 'BANKROLL MENU'
      puts '*************'
      
      @current_player.display_money
      puts "\nWould you like to add more funds? (y/n)"
      add_more = gets.strip.downcase
      if add_more == 'y' 
        puts 'How much money would you like to add?'
        money = gets.strip.to_f
        @current_player.balance('+', money)
        @current_player.display_money
        main_menu
      else
        main_menu
      end
    end

    def player_menu
      puts '********************'
      puts ' SELECT YOUR PLAYER '
      puts '********************'

      @players.each_with_index do |player, i|
      	puts "#{i + 1 }. #{player.name}"
      end
      puts "#{@players.length + 1}. ADD NEW PLAYER"

      selection = gets.strip.to_i - 1

      if selection < @players.length
      	@current_player = @players[selection]
      	main_menu
      elsif selection == @players.length
      	@current_player = Player::Person.new
      	@current_player.gets_info
        @players << @current_player

        main_menu
       else 
       	puts 'Invalid selection.'
       	player_menu
      end
    end
end

@game = Casino.new
@game.play 
