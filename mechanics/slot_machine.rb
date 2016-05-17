require 'pry'

module Mechanics
  module Slots
    def self.spin
      display_reel = []
      reel_one = ['A', 'Jackpot!!', 'Cherry!', '7', 'BAR']
      display_reel << reel_one.sample << reel_one.sample << reel_one.sample 
    end
  end
end
