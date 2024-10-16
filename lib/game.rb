class Game
    def initialize
    end

    def start
        puts "Welcome to War! (or Peace)" 
        puts "This game will be played with 52 cards."
        puts "The players today are #{@player1.name} and #{@player2.name}."
        puts "Type 'GO' to start the game!"
        puts "------------------------------------------------------------------"
    
        input = gets.chomp
    
        if input.upcase == 'GO'
            puts "Let's get started!"
        else 
            puts "Invalid input, session ended." 
        end
    end

   
