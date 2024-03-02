
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
  return new NullAction()
    // Draw Phase
    .chain(new ModifyEvilPointsAction(owner, 9999))
    .chain(CardGame_Action_drawCards(owner, cardsToDraw))
    // Attack Phase
    .chain(new PerformAttackPhaseAction(owner))
    // Morale Phase
    .chain(new PerformMoralePhaseAction(owner))
    // Standby Phase
    .chain(new PerformStandbyPhaseAction(owner));
}

function CardGame_Action_endTurn(owner) {
  var stats = CardGame_getStats(owner);
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

function CardGame_allCardsInPlay(owner_ = undefined) {
  var arr = [];
  var i = 0;
  with (obj_PlayerMinionRow) {
    if ((!is_undefined(owner_)) && (owner_ != owner)) {
      continue;
    }
    for (var j = 0; j < cardCount(); j++) {
      arr[i++] = getCard(j);
    }
  }
  with (obj_PlayerOngoingRow) {
    if ((!is_undefined(owner_)) && (owner_ != owner)) {
      continue;
    }
    for (var j = 0; j < cardCount(); j++) {
      arr[i++] = getCard(j);
    }
  }
  return arr;
}

function CardGame_querySum(owner, callable) {
  // Invoke the callable for each card in play belonging to the given
  // owner. Returns the sum of the results.
  if (is_method(callable) || !is_struct(callable)) {
    callable = { call: callable };
  }

  var arr = CardGame_allCardsInPlay(owner);
  var sum = 0;
  for (var i = 0; i < array_length(arr); i++) {
    sum += callable.call(arr[i]);
  }
  return sum;
}

function CardGame_isImmuneTo(effectOwner, targetCard) {
  if (targetCard.isImmuneTo(effectOwner)) {
    return true;
  }
  var arr = CardGame_allCardsInPlay(targetCard.owner);
  for (var i = 0; i < array_length(arr); i++) {
    if (arr[i].grantsPassiveImmunity(effectOwner)) {
      return true;
    }
  }
  return false;
}

function CardGame_orderByPower(minion1, minion2) {
  // Cards that refer to "most powerful" use this ordering. Cards are
  // first compared by their level * morale. Then, as a tiebreaker, we
  // use morale alone.
  var m1 = 1000 * (minion1.getLevel() * minion1.getMorale()) + minion1.getMorale();
  var m2 = 1000 * (minion2.getLevel() * minion2.getMorale()) + minion2.getMorale();
  return sign(m1 - m2);
}
