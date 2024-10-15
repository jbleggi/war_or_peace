# rspec spec/player_spec.rb

require 'rspec'
require_relative '../lib/player'
require_relative '../lib/deck' 
require_relative '../lib/card' 

RSpec.describe Player do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)    
    card3 = Card.new(:heart, 'Ace', 14) 

    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    it 'exists' do
        expect(player).to be_an_instance_of(Player)
    end

    it 'has a name' do
        expect(player.name).to eq('Clarisa')
    end

    it 'has a deck' do
        expect(player.deck).to be_an_instance_of(Deck)
    end

    it 'loses the game when there are no more cards in its deck' do
        expect(player.has_lost?).to eq(false)
    end
end