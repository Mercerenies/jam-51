
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
CardGame_getStats(CardPlayer.LEFT).maxFortDefense = global.__CardGame_fieldProfile.defense;
CardGame_getStats(CardPlayer.RIGHT).maxFortDefense = global.__CardGame_fieldProfile.defense;

// Start the game proper
var startPlayer = CardPlayer.LEFT;
var startAction = CardGame_Action_startGame()
    .chain(CardGame_Action_startTurn(startPlayer));
CardGame_runAction(startAction);

// DEBUG CODE
CardGame_getMinionRow(CardPlayer.LEFT).cards = [new CardMushroom(CardPlayer.LEFT), new CardSpikyMushroom(CardPlayer.LEFT)]
CardGame_getMinionRow(CardPlayer.RIGHT).cards = [new CardMushroom(CardPlayer.RIGHT)]

/*
CardGame_getOngoingRow(CardPlayer.LEFT).cards = [new CardMushroom(CardPlayer.LEFT), new CardMushroom(CardPlayer.LEFT)]
CardGame_getOngoingRow(CardPlayer.RIGHT).cards = [new CardPotOfLinguine(CardPlayer.RIGHT), new CardMushroom(CardPlayer.RIGHT)]

CardGame_getDiscardPile(CardPlayer.LEFT).cards = []
CardGame_getDiscardPile(CardPlayer.RIGHT).cards = [CardPotOfLinguine, CardMushroom, CardMushroom, CardMushroom, CardMushroom]
*/
