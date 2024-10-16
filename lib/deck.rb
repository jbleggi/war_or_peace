require_relative '../lib/card' 

class Deck
    attr_reader :cards
    
    def initialize(cards)
        @cards = cards
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

    def add_card(card)
        @cards << card
    end

    def self.create_deck
        suits = [:hearts, :diamonds, :clubs, :spades]
        values = [
          ['2', 2],
          ['3', 3],
          ['4', 4],
          ['5', 5],
          ['6', 6],
          ['7', 7],
          ['8', 8],
          ['9', 9],
          ['10', 10],
          ['Jack', 11],
          ['Queen', 12],
          ['King', 13],
          ['Ace', 14]
        ]
        
        deck = []
      
        # Create the cards in the deck using a loop
        suits.each do |suit|
          values.each do |value, rank|
            deck << Card.new(suit, value, rank)
          end
        end
      
        deck  # Return the created deck
    end
    
    def self.shuffle
        @cards.shuffle!
        new(deck)
    end
end