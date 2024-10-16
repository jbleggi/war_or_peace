require_relative '../lib/deck' 
require_relative '../lib/turn'
require_relative '../lib/player'
require_relative '../lib/card' 

class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turns = 0
  end

  def start
    puts "Welcome to War! This game will be played with 52 cards."
    # Get player names
    
    puts "Enter Player 1's name: "
    player1_name = gets.chomp
    puts "Enter Player 2's name: "
    player2_name = gets.chomp

    puts "The players today are #{player1_name.capitalize} and #{player2_name.capitalize}."

    puts "Type 'GO' to start the game!"
  
    input = gets.chomp
    if input.upcase == 'GO'
      setup_game(player1_name, player2_name) ##added
      # deck = Deck.new(@cards)
      # deck = Deck.create_deck.shuffle  
      
      # @player1.deck = deck.first(26)
      # @player2.deck = deck.last(26)
      
      # play
    else
      puts "Invalid input. Please type 'GO' to start."
    end
  end

  def setup_game(player1_name, player2_name)
  deck = Deck.create_deck.shuffle

  @player1 = Player.new(player1_name, Deck.new(deck.first(26)))
  @player2 = Player.new(player2_name, Deck.new(deck.last(26)))

  game = Game.new(@player1, @player2)
  game.play  
end

  def play
    while @turns < 1_000_000 && @player1.has_lost? && @player2.has_lost?
      @turns += 1
      turn_result = play_turn
      puts turn_result
    end
    declare_winner
  end

  def play_turn
    card1 = @player1.deck.deal
    card2 = @player2.deck.deal

    if card1.value > card2.value
     @player1.deck.cards.push(card1, card2)
      "#{turn_message}#{@player1.name} won 2 cards"
    elsif card2.value > card1.value
      @player2.deck.cards.push(card1, card2)
      "#{turn_message}#{@player2.name} won 2 cards"
    else

      "*mutually assured destruction* 2 cards removed from play"
    end
  end

  def turn_message
    "Turn #{@turns}: "
  end

  def declare_winner
    if @player1.has_lost? 
      "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
    elsif @player2.has_lost?
      "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
    else
    "---- DRAW ----"
    end
  end
end  
