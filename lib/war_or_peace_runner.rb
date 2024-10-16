# ruby war_or_peace_runner.rb
require_relative '../lib/game'
require_relative '../lib/deck' 
require_relative '../lib/turn'
require_relative '../lib/player'
require_relative '../lib/card' 

class Setup
  def initialize
    @player1 = nil
    @player2 = nil
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."

    # Get player names
    p "Enter Player 1's name: "
    player1_name = gets.chomp
    p "Enter Player 2's name: "
    player2_name = gets.chomp

    p "The players today are #{@player1_name} and #{@player2_name}."
    p "Type 'GO' to start the game!"

    input = gets.chomp
    if input.upcase == 'GO'
      setup_game(@player1_name, @player2_name)
    else
      p "Invalid input. Please type 'GO' to start."
    end
  end

  def game(player1_name, player2_name)
    deck = Deck.create_deck.shuffle  
    deck1 = deck.first(26)  
    deck2 = deck.last(26)   

    @player1 = Player.new(@player1_name, Deck.new(deck1))
    @player2 = Player.new(@player2_name, Deck.new(deck2))
  end
end
  game = Game.new(@player1_name, @player2_name)
  game.start