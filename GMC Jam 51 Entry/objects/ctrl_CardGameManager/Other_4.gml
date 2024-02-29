
var playerDeck = arrayCopy(global.__CardGame_playerProfile.deck);
array_shuffle_ext(playerDeck);
CardGame_getDeck(CardPlayer.LEFT).cards = playerDeck;
CardGame_getDeck(CardPlayer.LEFT).originalDeckSize = array_length(playerDeck);

var enemyDeck = arrayCopy(global.__CardGame_enemyProfile.deck);
array_shuffle_ext(enemyDeck);
CardGame_getDeck(CardPlayer.RIGHT).cards = enemyDeck;
CardGame_getDeck(CardPlayer.RIGHT).originalDeckSize = array_length(enemyDeck);

// DEBUG CODE
CardGame_getDiscardPile(CardPlayer.LEFT).cards = []
CardGame_getDiscardPile(CardPlayer.RIGHT).cards = [CardPotOfLinguine, CardMushroom, CardMushroom, CardMushroom, CardMushroom]
