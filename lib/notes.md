# Iteration 1
## Card class
### Notes from lesson
-   Type of object: card
-   Specific instances: player 1 cards, player 2 cards
-   Attributes: suit, number/letter, rank
-   Behaviors: play, discard, collect, lose

`rspec spec/card_spec.rb`

`./lib/card`

-   require './lib/card'
-   card = Card.new(:heart, 'Jack', 11)
-   card.suit
-   card.value
-   card.rank


## Deck class
- initialize: this method will take one argument - an array of cards.
- cards: an attr_reader to read the @cards attribute
- rank_of_card_at: this method will take one argument that represents the index location of a card to be used (typically 0 or 2 more on this later 😉 ) and will return the rank of that card.
- high_ranking_cards: this method will return an array of cards in the deck that have a rank of 11 or above (face cards and aces)
- percent_high_ranking: this method will return the percentage of cards that are high ranking
- remove_card: this method will remove the top card from the deck
- add_card: this method will add one card to the bottom (end) of the deck