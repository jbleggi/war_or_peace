class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = [] 
  end

  def type    
    if @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && @player1.deck.cards[2].rank == @player2.deck.cards[2].rank
      @type = :mutually_assured_destruction
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
      @type = :war
    else
      @type = :basic
    end
  end

  def winner
    if @type == :basic
      card1 = @player1.deck.cards[0]
      card2 = @player2.deck.cards[0]
      if card1.rank > card2.rank
        @player1
      else
        @player2
      end
    elsif @type == :war
      card1 = @player1.deck.cards[2]
      card2 = @player2.deck.cards[2] 
      if card1.rank > card2.rank
        @player1
      else
        @player2
      end
    else
      return "No Winner"
    end
  end

  def pile_cards
    if @type == :basic
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    elsif @type == :war
      3.times do
        @spoils_of_war << @player1.deck.cards.shift
        @spoils_of_war << @player2.deck.cards.shift
      end 
    else
      3.times do
        @player1.deck.cards.shift
        @player2.deck.cards.shift
      end
    end
  end

  def award_spoils(winner)
    if winner
      winner.deck.cards.concat(@spoils_of_war) 
      @spoils_of_war.clear
    end
  end
end