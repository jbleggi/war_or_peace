require 'rspec'
require_relative '../lib/deck'
require_relative '../lib/card'

RSpec.describe Deck do
    it 'exists' do
        cards = [card1 = Card.new(:diamond, 'Queen', 12), card2 = Card.new(:spade, '3', 3), card3 = Card.new(:heart, 'Ace', 14)]

        deck = Deck.new(cards)

        expect(deck).to be_an_instance_of(Deck)
    end

    it 'returns rank of cards based on index arg' do
        #take index as argument & return rank of index position

        cards = [card1 = Card.new(:diamond, 'Queen', 12), card2 = Card.new(:spade, '3', 3), card3 = Card.new(:heart, 'Ace', 14)]

        deck = Deck.new(cards)

        expect(deck.rank_of_card_at(0)).to eq(12)
        expect(deck.rank_of_card_at(1)).to eq(3)        
        expect(deck.rank_of_card_at(2)).to eq(14)
    end

    it 'returns an array of cards ranking 11 or higher' do
        cards = [card1 = Card.new(:diamond, 'Queen', 12), card2 = Card.new(:spade, '3', 3), card3 = Card.new(:heart, 'Ace', 14)]

        deck = Deck.new(cards)

        expect(deck.high_ranking_cards).to include(card1, card3)
    end

    it 'returns a percentage of cards that are high ranking' do
        cards = [card1 = Card.new(:diamond, 'Queen', 12), card2 = Card.new(:spade, '3', 3), card3 = Card.new(:heart, 'Ace', 14)]

        deck = Deck.new(cards)
        
        expect(deck.percent_high_ranking).to eq(66.67)
    end

it 'removes top card' do
    cards = [card1 = Card.new(:diamond, 'Queen', 12), card2 = Card.new(:spade, '3', 3), card3 = Card.new(:heart, 'Ace', 14)]

    deck = Deck.new(cards)

    expect(deck.remove_card).to eq(card1)
end

end

