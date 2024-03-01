
var playerDeck = arrayCopy(global.__CardGame_playerProfile.deck);
array_shuffle_ext(playerDeck);
CardGame_getDeck(CardPlayer.LEFT).cards = playerDeck;
CardGame_getDeck(CardPlayer.LEFT).originalDeckSize = array_length(playerDeck);

var enemyDeck = arrayCopy(global.__CardGame_enemyProfile.deck);
array_shuffle_ext(enemyDeck);
CardGame_getDeck(CardPlayer.RIGHT).cards = enemyDeck;
CardGame_getDeck(CardPlayer.RIGHT).originalDeckSize = array_length(enemyDeck);

// Start both sides with the same fort defense.
CardGame_getStats(CardPlayer.LEFT).fortDefense = global.__CardGame_fieldProfile.defense;
CardGame_getStats(CardPlayer.RIGHT).fortDefense = global.__CardGame_fieldProfile.defense;

// The game begins with each player drawing five cards.
var startGameAction =
    CardGame_drawCards(CardPlayer.LEFT, DEFAULT_HAND_LIMIT)
    .chain(CardGame_drawCards(CardPlayer.RIGHT, DEFAULT_HAND_LIMIT));
CardGame_runAction(startGameAction);

// DEBUG CODE
/*
CardGame_getDiscardPile(CardPlayer.LEFT).cards = []
CardGame_getDiscardPile(CardPlayer.RIGHT).cards = [CardPotOfLinguine, CardMushroom, CardMushroom, CardMushroom, CardMushroom]

// DEBUG CODE
CardGame_getHand(CardPlayer.LEFT).cards = [CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardPotOfLinguine, CardPotOfLinguine, CardPotOfLinguine, CardMushroom]
CardGame_getHand(CardPlayer.RIGHT).cards = [CardPotOfLinguine, CardMushroom, CardMushroom, CardMushroom, CardMushroom]
CardGame_getMinionRow(CardPlayer.LEFT).cards = [new CardMushroom()]
CardGame_getMinionRow(CardPlayer.RIGHT).cards = [new CardMushroom()]
CardGame_getOngoingRow(CardPlayer.LEFT).cards = [new CardMushroom(), new CardMushroom()]
CardGame_getOngoingRow(CardPlayer.RIGHT).cards = [new CardPotOfLinguine(), new CardMushroom()]
*/
