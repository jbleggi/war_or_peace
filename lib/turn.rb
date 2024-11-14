require './spec_helper.rb'

class Turn
  attr_reader :player1, :player2, :spoils_of_war, :winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = winner
  end

  def type    
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      @type = :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      @type = :war
    else
      @type = :basic
    end
  end

  def winner
    if @type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @winner = @player1
        puts "#{@player1.name} won 2 cards"
        # puts "#{@player1.name} wins this turn."
      elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
        @winner = @player2
        puts "#{@player2.name} won 2 cards"
        # puts "#{@player2.name} wins this turn."
      end
    end

    if @type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @winner = @player1
        puts "WAR - #{@player1.name} won 6 cards"
        # puts "#{@player1.name} wins this turn."
      else @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
        @winner = @player2
        puts "WAR - #{@player2.name} won 6 cards"
        # puts "#{@player2.name} wins this turn."
      end
    end

    if @type == :mutually_assured_destruction
      puts "No Winner"
      puts "*mutually assured destruction* 6 cards removed from play"
    end

  end
#######################
  def pile_cards
    if @type == :basic
      @spoils_of_war << [@player1.deck.cards.shift]
      @spoils_of_war << [@player2.deck.cards.shift]
    elsif @type == :war
      3.times do
        @spoils_of_war << [@player1.deck.cards.shift]
        @spoils_of_war << [@player2.deck.cards.shift]
      end 
    else
      3.times do
        [@player1.deck.cards.shift]
        [@player2.deck.cards.shift]
      end
    end
    # puts @spoils_of_war.inspect
  end

  def award_spoils
    if @winner != nil
      @winner.deck.cards.concat(@spoils_of_war)
      @spoils_of_war.clear
    end
  end

 ##############GAME PLAY##############
  def start
    turn_count = 0
  
    while turn_count < 1_000_000
      if @player1.has_lost?
        puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
        return
      elsif @player2.has_lost?
        puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
        return
      end
  
      # Start a new turn
      turn_count += 1
      turn = Turn.new(@player1, @player2)
      #debug statement
      puts "Player 1 has #{@player1.deck.cards.count} cards. Player 2 has #{@player2.deck.cards.count} cards."
      #debug statement
      puts "Turn #{turn_count}: #{@player1.name} has the #{@player1.deck.cards[0].value} of #{@player1.deck.cards[0].suit}. || #{@player2.name} has the #{@player2.deck.cards[0].value} of #{@player2.deck.cards[0].suit}."
      turn.type  
      #debug statement
      puts "Turn type: #{turn.type.upcase}"
      turn.pile_cards
      turn.winner
      turn.award_spoils
      puts "-----------------------------------"
    end
  
    # If the loop ends after 1,000,000 turns, it's a draw
    puts "---- DRAW ----"
  end 
end