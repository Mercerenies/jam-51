
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

// DEBUG CODE
CardGame_getHand(CardPlayer.LEFT).cards = [CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardPotOfLinguine, CardPotOfLinguine, CardPotOfLinguine, CardMushroom]
CardGame_getHand(CardPlayer.RIGHT).cards = [CardPotOfLinguine, CardMushroom, CardMushroom, CardMushroom, CardMushroom]
CardGame_getMinionRow(CardPlayer.LEFT).cards = [CardMushroom]
CardGame_getMinionRow(CardPlayer.RIGHT).cards = [CardPotOfLinguine]
CardGame_getOngoingRow(CardPlayer.LEFT).cards = [CardMushroom, CardMushroom]
CardGame_getOngoingRow(CardPlayer.RIGHT).cards = [CardPotOfLinguine, CardMushroom]
