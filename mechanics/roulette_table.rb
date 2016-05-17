require 'pry'
module Mechanics
  module Roulette
    def self.roll
      winning_number = []
      winning_number << rand(1..30)
      return winning_number
    end

  end

end