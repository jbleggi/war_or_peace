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
      if  @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @winner = @player1
      else
        @winner = @player2
      end
    elsif @type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @winner = @player1
      else
        @winner = @player2
      end
    else
      @winner = nil
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

  def award_spoils
    @winner.deck.add_card(@spoils_of_war)

    @spoils_of_war.clear
  end

 ##############GAME PLAY##############
  def start
    turn_count = 0
  
    while turn_count < 1_000_000
      # Check if either player has lost the game
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

      # Debugging: Show the turn number and the state of the players' top cards
      puts "Turn #{turn_count}: #{@player1.name} has the #{@player1.deck.cards[0].value} of #{@player1.deck.cards[0].suit} || #{@player2.name} has the #{@player2.deck.cards[0].value} of #{@player2.deck.cards[0].suit}"
  
      turn.type  # Determine the type of the turn
      puts "Turn type: #{turn.type.upcase}"  # Debugging output to check turn type
      turn.pile_cards
      ##########################PROBLEMS START HERE#######################
      #      require 'pry'; binding.pry
      turn.winner

      if @winner.is_a?(Player)
        puts "#{@winner.name} wins this turn."
      else
        puts "No winner this turn."
      end
      
      turn.award_spoils
  
      # Print the result of this turn based on the type of the turn
      if turn.type == :mutually_assured_destruction
        puts "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
      elsif turn.type == :war
        puts "Turn #{turn_count}: WAR - #{@winner.name} won 6 cards"
      elsif turn.type == :basic
        puts "Turn #{turn_count}: #{@winner.name} won 2 cards"
      end
  
      # Debugging: Check the number of cards remaining after the turn
      puts "#{@player1.name} has #{@player1.deck.cards.count} cards remaining."
      puts "#{@player2.name} has #{@player2.deck.cards.count} cards remaining."
      puts "-----------------------------------"
    end
  
    # If the loop ends after 1,000,000 turns, it's a draw
    puts "---- DRAW ----"
  end 
end