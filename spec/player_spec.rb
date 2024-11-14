require './spec_helper.rb'

RSpec.describe do
  before(:all) do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3) 
    @card3 = Card.new(:heart, 'Ace', 14)    
    
    @deck = Deck.new([@card1, @card2, @card3])

    @player = Player.new('Clarisa', @deck)


  end

  describe 'instantiation' do
    it 'exists' do
      expect(@player).to be_an_instance_of Player
    end

    it 'has readable attributes' do
      expect(@player.name).to eq "Clarisa"
      expect(@player.deck).to eq(@deck)
    end
  end

  describe 'behaviors' do
    it 'can lose' do
      expect(@player.has_lost?).to eq false

      @deck.remove_card
      @deck.remove_card
      @deck.remove_card

      expect(@player.has_lost?).to eq true
    end
  end
end