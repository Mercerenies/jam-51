
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
  // TODO standby phase
  return new NullAction()
    // Draw Phase
    .chain(new ModifyEvilPointsAction(owner, 9999))
    .chain(CardGame_Action_drawCards(owner, cardsToDraw))
    // Attack Phase
    .chain(new PerformAttackPhaseAction(owner))
    // Morale Phase
    .chain(new PerformMoralePhaseAction(owner));
}

function CardGame_Action_endTurn(owner) {
  var stats = CardGame_getStats(owner);
  var cardsToDraw = stats.getCardsPerTurn();
  // TODO end phase card actions
  return new NullAction()
    // End Phase
    .chain(new ModifyEvilPointsAction(owner, -9999))
}

function CardGame_Action_betweenTurns() {
  return new BetweenTurnsAction();
}

function CardGame_Action_enemyTurn() {
  return new NullAction()
    .chain(new ContinueEnemyTurnAction())
    // End enemy turn
    .chain(CardGame_Action_endTurn(CardPlayer.RIGHT))
    .chain(CardGame_Action_betweenTurns())
    .chain(CardGame_Action_startTurn(CardPlayer.LEFT));
}

function CardGame_Action_playCard(owner, cardIndex) {
  return new PlayCardAction(owner, cardIndex);
}

// Look for the card on the field somewhere.
function CardGame_findCard(card) {
  with (par_CardStrip) {
    var idx = searchCard(card);
    if (!is_undefined(idx)) {
      return { object: self.id, index: idx };
    }
  }
  return undefined;
}

// Returns a CardPlayer if there is a winner, or undefined if not.
function CardGame_checkEndGame() {
  var enemyStats = CardGame_getStats(CardPlayer.RIGHT);
  if (enemyStats.fortDefense <= 0) {
    return CardPlayer.LEFT;
  }
  var playerStats = CardGame_getStats(CardPlayer.LEFT);
  if (playerStats.fortDefense <= 0) {
    return CardPlayer.RIGHT;
  }
  return undefined;
}

function CardGame_endGame(winner) {
  // winner shall be a CardPlayer.
  //
  // TODO Implement this for real. (DEBUG CODE)
  if (winner == CardPlayer.LEFT) {
    show_message("You win");
  } else {
    show_message("You lose");
  }
  game_end();
}

function CardGame_allCardsInPlay() {
  var arr = [];
  var i = 0;
  with (par_CardStrip) {
    for (var j = 0; j < cardCount(); j++) {
      arr[i++] = getCard(j);
    }
  }
  return arr;
}
