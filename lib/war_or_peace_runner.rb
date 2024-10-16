# ruby lib/war_or_peace_runner.rb

require_relative '../lib/turn'
require_relative '../lib/player'
require_relative '../lib/deck' 
require_relative '../lib/card' 

def create
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

        #create the cards in the deck using a loop
        suits.each do |suit|
            values.each do |value, rank|
                deck << Card.new(suit, value, rank)
            end
    end
end

# # Split the deck into two halves based on index
# deck1 = deck[0...26] 
# deck2 = deck[26..51]  

# [Deck.new(deck1), Deck.new(deck2)]  # Return two Deck objects


# deck = create_deck  # Function to create and shuffle the deck
# player1 = Player.new("Megan", Deck.new(deck1))  # Initial empty deck
# player2 = Player.new("Aurora", Deck.new(deck2))


require 'pry'; binding.pry