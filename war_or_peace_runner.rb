require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

#####Create 52 Cards (A standard deck)#####
suits = [:heart, :diamond, :club, :spade]
values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

@full_deck = []

suits.each do |suit|
    values.each_with_index do |value, index|
      rank = ranks[index]
      @full_deck << Card.new(suit, value, rank)
    end
end

#####Put those card into two Decks (some randomness would be nice here!)#####
@full_deck.shuffle!
@deck1 = @full_deck[0..25]
@deck2 = @full_deck[26..-1]

#######GAME BEGINS###########
puts "Welcome to War! (or Peace) This game will be played with 52 cards."

puts "Enter the first player's name."
@name1 = gets.chomp
@player1 = Player.new(@name1.capitalize, @deck1)

puts "Enter the second player's name."
@name2 = gets.chomp
@player2 = Player.new(@name2.capitalize, @deck2)

puts "The players today are #{@name1.upcase} and #{@name2.upcase}."

puts "Type 'GO' to start the game!"

while true
    input = gets.chomp

    if input.upcase == 'GO'
        puts "------------------------------------------------------------------"
        start
        break
    else
        puts "Type 'GO' to start the game!"
    end
end

def start
  
end