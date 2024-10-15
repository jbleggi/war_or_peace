require_relative '../lib/card' 

class Deck
    attr_reader :cards

    def initialize(cards = [])
        @cards = cards
        # @rankings = @cards.map { |card| card.rank }
        # .map takes each element of og array & passes it to block {}, transforms, & creates new array
    end

    def rank_of_card_at(index)
        @cards[index].rank
    end

    def high_ranking_cards
        @cards.select { |card| card.rank >= 11 }
        #filters array |element| based on condition & returns new array
    end

    def percent_high_ranking
        (high_ranking_cards.length.to_f / @cards.length * 100).round(2)
    end

    def remove_card
        cards.delete_at(0)
    end

end

# cards = [card1 = Card.new(:diamond, 'Queen', 12), card2 = Card.new(:spade, '3', 3), card3 = Card.new(:heart, 'Ace', 14)]

# deck = Deck.new(cards)

# require 'pry'; binding.pry