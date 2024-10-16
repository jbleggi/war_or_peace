require_relative '../lib/deck'
require_relative '../lib/card' 

class Player
    attr_reader :name, :deck

    def initialize(name, deck)
        @name = name
        @deck = deck
    end

    def has_lost?
        @deck.cards.empty?
    end
end




# card1 = Card.new(:diamond, 'Queen', 12)
# card2 = Card.new(:spade, '3', 3)    
# card3 = Card.new(:heart, 'Ace', 14) 

# deck = Deck.new([card1, card2, card3])

# player = Player.new('Clarisa', deck)

# require 'pry'; binding.pry