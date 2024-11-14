require './spec_helper.rb'

class Player
  attr_reader :name, :deck
  
  def initialize(name, deck)
    @name = name
    @deck = deck
    @has_lost = false
  end

  def has_lost?
    @deck.empty?
  end
end