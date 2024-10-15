require_relative '../lib/turn'
require_relative '../lib/player'
require_relative '../lib/deck' 
require_relative '../lib/card' 

class Turn
    attr_reader :player1, :player2, :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    # def type
        
end
