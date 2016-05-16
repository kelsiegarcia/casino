require_relative 'player'
require_relative 'menu'

Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file }

class Casino
    # include Mechanics
    include Player
    include Menu

    def initialize
        @player = Player::Person.new
    end

    def play
        puts 'Welcome to the casino!'
        player = Player::Person.new
        player.gets_info

        Menu::Main_menu.display

    end

    
end

@game = Casino.new
@game.play 




# Choose game from menu (slots and high/low)

# Player makes bet
# Bankroll either moves up or down

