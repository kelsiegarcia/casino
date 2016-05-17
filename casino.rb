require 'pry'
require_relative 'player'
require_relative 'menu'

Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file }

class Casino
    include Player
    include Menu

    def initialize
        @player = Player::Person.new
    end

    def play
        puts 'Welcome to the casino!'
        @player.gets_info
        Menu::MainMenu.display(@player)
    end

    
end

@game = Casino.new
<<<<<<< 3e91d05c8e5bc9e9f73cf84b15d0a33ff22aedda
@game.play 
=======
@game.play
>>>>>>> Roulette game!
