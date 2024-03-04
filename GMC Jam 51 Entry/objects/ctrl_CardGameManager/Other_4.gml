
var playerDeck = arrayCopy(global.__CardGame_playerProfile.deck);
array_shuffle_ext(playerDeck);
CardGame_getDeck(CardPlayer.LEFT).cards = playerDeck;
CardGame_getDeck(CardPlayer.LEFT).originalDeckSize = array_length(playerDeck);

var enemyDeck = arrayCopy(global.__CardGame_enemyProfile.deck);
array_shuffle_ext(enemyDeck);
CardGame_getDeck(CardPlayer.RIGHT).cards = enemyDeck;
CardGame_getDeck(CardPlayer.RIGHT).originalDeckSize = array_length(enemyDeck);

enemyAi = global.__CardGame_enemyProfile.ai;

// The player always goes first, so the enemy gets +2 fort defense, to compensate.
CardGame_getStats(CardPlayer.LEFT).fortDefense = global.__CardGame_fieldProfile.defense;
CardGame_getStats(CardPlayer.RIGHT).fortDefense = global.__CardGame_fieldProfile.defense + 2;
CardGame_getStats(CardPlayer.LEFT).maxFortDefense = global.__CardGame_fieldProfile.defense;
CardGame_getStats(CardPlayer.RIGHT).maxFortDefense = global.__CardGame_fieldProfile.defense + 2;

// Start the game proper
var startPlayer = CardPlayer.LEFT;
var startAction = CardGame_Action_startGame()
    .chain(CardGame_Action_startTurn(startPlayer));
CardGame_runAction(startAction);
