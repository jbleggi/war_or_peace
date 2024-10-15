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

    def type
        if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
            :basic
        elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
            :war
        else
            :mutually_assured_destruction
        end
    end

    def winner
        case type
            when :basic
                if player1.deck.cards[0].rank > player2.deck.cards[0].rank 
            :player1
                else :player2
                end         
            when :war
                if player1.deck.cards[2].rank > player2.deck.cards[2].rank 
            :player1 
                else :player2
                end
            when :mutually_assured_destruction
                "No Winner"
        end
    end  

    def pile_cards
        case type
        when :basic
        #each player sends 1 card to the spoils 
            @spoils_of_war << player1.deck.cards.shift
            @spoils_of_war << player2.deck.cards.shift
        when :war
        #each player sends 3 cards to the spoils 
            3.times do
                @spoils_of_war << player1.deck.cards.shift
                @spoils_of_war << player2.deck.cards.shift
            end
        when :mutually_assured_destruction
            #each player discards 3
            3.times do
                player1.deck.cards.shift
                player2.deck.cards.shift     
            end    
        end
    end   
    
    def award_spoils(winner)
        player.deck << @spoils_of_war
        @spoils_of_war.clear
        #to empty
    end
end
