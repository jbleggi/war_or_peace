class Card
    attr_reader :rank, :value, :suit

    def initialize(suit, value, rank)
        @suit = suit
        @value = value
        @rank = rank
    end
end
