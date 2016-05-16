module Mechanics
  class Card
    attr_accessor :rank, :suit, :color
    #card = Card.new('K', 'Spade', 'Black')
    def initialize(rank, suit)
      @rank = rank
      @suit = suit
      @color = (suit == 'Spades' || suit == 'Clubs') ? 'Black' : 'Red'
    end
  end

  class Deck
    attr_accessor :cards

    def initialize
      @ranks = %w(2 3 4 5 6 7 8 9 10 J Q K A)
      @suits = %w(Spades Diamonds Clubs Hearts)
      @cards = []
      generate_deck
    end

    def generate_deck
      @suits.each do |suit|
        @ranks.each do |rank|
          @cards << Card.new(rank, suit)
        end   
      end
    end

    def pick_a_card
      @cards.sample.rank
    end

    def self.rank_index
    	%w(2 3 4 5 6 7 8 9 10 J Q K A)
    end
  end

end