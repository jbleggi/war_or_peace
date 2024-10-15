class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
        # @rankings = @cards.map { |card| card.rank }
        # .map takes each element of og array & passes it to block {}, transforms, & creates new array
    end

    def rank_of_card_at(index)
        @cards[index].rank
    end

    def high_ranking_cards
        @cards.select { |card| card.rank >= 11 }
    end

end