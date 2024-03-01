
// Higher-level API for card effects and actions that can be performed
// in the game.

function CardGame_Action_drawCards(owner, n) {
  return new DrawCardAction(owner).times(n);
}

function CardGame_Action_startGame(delay = 60) {
  var startingHand = DEFAULT_HAND_LIMIT;
  return new DelayAction(delay)
    .chain(CardGame_Action_drawCards(CardPlayer.LEFT, startingHand))
    .chain(CardGame_Action_drawCards(CardPlayer.RIGHT, startingHand));
}

function CardGame_Action_startTurn(owner) {
  var stats = CardGame_getStats(owner);
  var cardsToDraw = stats.getCardsPerTurn();
  // TODO Attack phase, morale phase, standby phase
  return new NullAction()
    // Draw Phase
    .chain(new SetEvilPointsAction(owner, stats.getEvilPointsPerTurn()))
    .chain(CardGame_Action_drawCards(owner, cardsToDraw))
}
