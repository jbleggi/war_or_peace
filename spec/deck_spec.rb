require './spec_helper.rb'

RSpec.describe do
  before(:all) do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14) 

    @deck = Deck.new([])
  end

  describe 'instantiation' do
    it 'exists' do 
      expect(@deck).to be_an_instance_of Deck
    end

    it 'has readable attributes' do
      expect(@deck.cards).to be_an Array
      expect(@deck.cards).to eq([])
    end
  end

  describe 'behaviors' do
    it 'can add cards' do
      @deck.add_card(@card1)
      @deck.add_card(@card2)
      @deck.add_card(@card3)

      expect(@deck.cards).to be_an Array
      expect(@deck.cards.count).to eq 3
      expect(@deck.cards).to eq([@card1, @card2, @card3])
    end
    
    it 'ranks cards based on index values' do
      expect(@deck.rank_of_card_at(0)).to eq 12
      expect(@deck.rank_of_card_at(1)).to eq 3
      expect(@deck.rank_of_card_at(2)).to eq 14
    end

    it 'can return high ranking cards' do
      expect(@deck.high_ranking_cards).to be_an Array
      expect(@deck.high_ranking_cards).to eq([@card1, @card3])
    end
    
    it 'can return the percent of high ranking cards' do
      expect(@deck.percent_high_ranking).to eq(66.67)
    end

    it 'can remove the first card in the array' do
      expect(@deck.remove_card).to eq(@card1)
    end
  end
end