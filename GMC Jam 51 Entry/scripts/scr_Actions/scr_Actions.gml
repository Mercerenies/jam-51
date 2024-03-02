
// Actions which can be run in the context of the game.

// Abstract base class.
//
// An action is defined to take a continuation parameter, which it
// should execute when done. Continuation must be an object with a
// nullary call(). Note that it is possible to execute the
// continuation zero times or multiple times, but please be aware of
// the consequences of doing this. Such things should be restricted to
// special cases.
//
// Actions MUST be immutable, as they can be reused by helpers such as
// RepeatedAction.
function Action() constructor {

  static perform = function(continuation) {
    // Abstract method

    // All subclasses should override, but just in case, we call the
    // continuation here.
    continuation.call();
  }

  static chain = function(second) {
    return new ChainedAction(self, second);
  }

  static chainArray = function(arr) {
    var curr = self;
    for (var i = 0; i < array_length(arr); i++) {
      curr = curr.chain(arr[i]);
    }
    return curr;
  }

  static times = function(n) {
    if (n == 1) {
      // Efficiency hack, don't construct a silly object if n == 1.
      return self;
    }
    return new RepeatedAction(self, n);
  }
}

// Do nothing and invoke the continuation.
function NullAction() : Action() constructor {
  __actionType = "NullAction";
  static perform = function(continuation) {
    continuation.call();
  }
}

function ChainedAction(first_, second_) : Action() constructor {
  __actionType = "ChainedAction";
  first = first_;
  second = second_;

  static perform = function(continuation) {
    //show_message("First " + string(first));
    first.perform({
      continuation: continuation,
      second: second,
      call: function() {
        //show_message("Second " + string(second));
        second.perform(continuation);
      },
    });
  }

}

// Just a repeated chain N times, but implemented as its own class for
// efficiency.
function RepeatedAction(action_, times_) : Action() constructor {
  __actionType = "RepeatedAction";
  action = action_;
  times = times_;

  static perform = function(continuation) {
    if (times <= 0) {
      continuation.call();
    } else {
      action.perform({
        next: new RepeatedAction(action, times - 1),
        continuation: continuation,
        call: function() {
          next.perform(continuation);
        },
      });
    }
  }

}

// High-level DrawCard action, checks hand and deck. Reshuffles
// discard if necessary.
function DrawCardAction(owner_) : Action() constructor {
  __actionType = "DrawCardAction";
  owner = owner_;

  static perform = function(continuation) {
    // If the player's hand limit has been met, do not draw.
    var hand = CardGame_getHand(owner);
    var handLimit = CardGame_getStats(owner).getHandLimit();
    if (hand.cardCount() >= handLimit) {
      continuation.call();
      return;
    }

    // If the deck is empty and the discard pile is not, then trigger a
    // reshuffle. If both are empty, abort the draw action.
    var deck = CardGame_getDeck(owner);
    var discard = CardGame_getDiscardPile(owner);
    if (deck.isEmpty()) {
      if (discard.isEmpty()) {
        continuation.call();
        return;
      }
      new ReshuffleDiscardAction(owner).chain(new DrawCardPrimitiveAction(owner)).perform(continuation);
    } else {
      new DrawCardPrimitiveAction(owner).perform(continuation);
    }
  }
}

// Low-level DrawCard action, checks no preconditions.
function DrawCardPrimitiveAction(owner_) : Action() constructor {
  __actionType = "DrawCardPrimitiveAction";
  owner = owner_;

  static perform = function(continuation) {
    var deck = CardGame_getDeck(owner);
    var top = deck.popCard();
    if (!is_undefined(top)) {
      var hand = CardGame_getHand(owner);
      doMoveCardAnimation(deck, hand, new DeckIcon(), {
        hand: hand,
        card: top,
        continuation: continuation,
        call: function() {
          hand.appendCard(card);
          continuation.call();
        }
      });
    }
  }
}

function SendCardToDiscardAction(owner_, card_) : Action() constructor {
  __actionType = "SendCardToDiscardAction";
  owner = owner_;
  card = card_;

  static perform = function(continuation) {
    var discard = CardGame_getDiscardPile(owner);
    var cardLocation = CardGame_findCard(card);
    if (is_undefined(cardLocation)) {
      // Can't play animation
      continuation.call();
      return;
    }
    cardLocation.object.removeCard(cardLocation.index);
    doMoveCardAnimation(cardLocation.object, discard, card, {
      discard: discard,
      card: card,
      continuation: continuation,
      call: function() {
        discard.appendCard(card.getCardType());
        continuation.call();
      }
    });
  }
}

// Primitive action that plays the card movement animation. Use
// PlayCardAction for the full event, including EP subtraction and
// card effects that fire from it.
function PlayCardFromHandAction(owner_, cardIndex_, instantiatedCard_, destination_) : Action() constructor {
  __actionType = "PlayCardFromHandAction";
  owner = owner_;
  cardIndex = cardIndex_;
  instantiatedCard = instantiatedCard_;
  destination = destination_;

  static perform = function(continuation) {
    var hand = CardGame_getHand(owner);
    hand.removeCard(cardIndex);
    doMoveCardAnimation(hand, destination, instantiatedCard, {
      destination: destination,
      card: instantiatedCard,
      continuation: continuation,
      call: function() {
        destination.appendCard(card);
        continuation.call();
      }
    });
  }
}

function ReshuffleDiscardAction(owner_) : Action() constructor {
  __actionType = "ReshuffleDiscardAction";
  owner = owner_;

  static perform = function(continuation) {
    var deck = CardGame_getDeck(owner);
    var discard = CardGame_getDiscardPile(owner);
    var shuffledPile = arrayCopy(discard.cards);
    array_shuffle(shuffledPile);
    discard.clear();
    doMoveCardAnimation(discard, deck, new DeckIcon(), {
      deck: deck,
      shuffledPile: shuffledPile,
      continuation: continuation,
      call: function() {
        deck.replaceCards(shuffledPile);
        continuation.call();
      },
    });
  }
}

function DelayAction(time_) : Action() constructor {
  __actionType = "DelayAction";
  time = time_;

  static perform = function(continuation) {
    with (instance_create_layer(0, 0, "Instances_UI", obj_DelayAnimation)) {
      time = other.time;
      callback = continuation;
    }
  }
}

function ModifyEvilPointsAction(owner_, deltaPoints_) : Action() constructor {
  __actionType = "ModifyEvilPointsAction";
  owner = owner_;
  deltaPoints = deltaPoints_;

  static perform = function(continuation) {
    var stats = CardGame_getStats(owner);
    var actualNewPoints = clamp(stats.evilPoints + deltaPoints, 0, stats.getEvilPointsPerTurn());
    var difference = actualNewPoints - stats.evilPoints;
    stats.evilPoints = actualNewPoints;
    doTextAnimation(stats.evilPointsX(), stats.evilPointsY(), difference);
    continuation.call();
  }
}

function SetFortPointsAction(owner_, newPoints_) : Action() constructor {
  __actionType = "SetFortPointsAction";
  owner = owner_;
  newPoints = newPoints_;

  static perform = function(continuation) {
    var stats = CardGame_getStats(owner);
    var actualNewPoints = clamp(newPoints, 0, stats.maxFortDefense);
    var difference = actualNewPoints - stats.fortDefense;
    stats.fortDefense = actualNewPoints;
    doTextAnimation(stats.fortDefenseX(), stats.fortDefenseY(), difference);

    // Check for endgame
    var winner = CardGame_checkEndGame();
    if (!is_undefined(winner)) {
      CardGame_endGame(winner);
      // Note: Explicitly do NOT call the continuation; we break the
      // game loop here.
      return;
    }

    continuation.call();
  }
}

function HighlightCardAction(card_) : Action() constructor {
  __actionType = "HighlightCardAction";
  card = card_;

  static perform = function(continuation) {
    var location = CardGame_findCard(card);
    if (is_undefined(location)) {
      continuation.call();
      return;
    }
    var cardX = location.object.cardCenterX(location.index);
    var cardY = location.object.cardCenterY(location.index);
    with (instance_create_layer(cardX, cardY, "Instances_UI", obj_CardHighlightAnimation)) {
      callback = continuation
    }
  }
}

function PerformAttackAction(owner_, minion_) : Action() constructor {
  __actionType = "PerformAttackAction";
  owner = owner_;
  minion = minion_;

  static perform = function(continuation) {
    var minionRow = CardGame_getMinionRow(owner);
    var minionIndex = minionRow.searchCard(minion);
    if (is_undefined(minionIndex)) {
      // Minion was destroyed or something, so just skip.
      continuation.call();
      return;
    }

    var enemyStats = CardGame_getStats(otherPlayer(owner));
    var minionLevel = minion.getLevel();
    if (minionLevel <= 0) {
      // No attack, skip.
      continuation.call();
      return;
    }

    var newFortPoints = enemyStats.fortDefense - minionLevel;
    new NullAction()
      .chain(new SetFortPointsAction(otherPlayer(owner), newFortPoints))
      .chain(new HighlightCardAction(minion))
      .perform(continuation);
  }

}

function DropMoraleForMinionAction(owner_, minion_) : Action() constructor {
  __actionType = "DropMoraleForMinionAction";
  owner = owner_;
  minion = minion_;

  static perform = function(continuation) {
    var minionRow = CardGame_getMinionRow(owner);
    var minionIndex = minionRow.searchCard(minion);
    if (is_undefined(minionIndex)) {
      // Minion was destroyed or something, so just skip.
      continuation.call();
      return;
    }

    minion.modifyMorale(-1);
    if (minion.getMorale() <= 0) {
      new SendCardToDiscardAction(owner, minion).perform(continuation);
    } else {
      continuation.call();
    }
  }

}

function PerformAttackPhaseAction(owner_) : Action() constructor {
  __actionType = "PerformAttackPhaseAction";
  owner = owner_;

  static perform = function(continuation) {
    var action = new NullAction();
    var minions = CardGame_getMinionRow(owner).cards;
    for (var i = 0; i < array_length(minions); i++) {
      action = action.chain(new PerformAttackAction(owner, minions[i]));
    }
    action.perform(continuation);
  }
}

function PerformMoralePhaseAction(owner_) : Action() constructor {
  __actionType = "PerformMoralePhaseAction";
  owner = owner_;

  static perform = function(continuation) {
    var action = new NullAction();
    var minions = CardGame_getMinionRow(owner).cards;
    for (var i = 0; i < array_length(minions); i++) {
      action = action.chain(new DropMoraleForMinionAction(owner, minions[i]));
    }
    action.perform(continuation);
  }
}

function PerformStandbyPhaseAction(owner_) : Action() constructor {
  __actionType = "PerformStandbyPhaseAction";
  owner = owner_;

  static perform = function(continuation) {
    var action = new NullAction();
    var cards = CardGame_allCardsInPlay(owner);
    for (var i = 0; i < array_length(cards); i++) {
      action = action.chain(cards[i].onStandbyPhase());
    }
    action.perform(continuation);
  }
}

function PlayCardAction(owner_, cardIndex_) : Action() constructor {
  __actionType = "PlayCardAction";
  owner = owner_;
  cardIndex = cardIndex_;

  static perform = function(continuation) {
    var currentEvilPoints = CardGame_getStats(owner).evilPoints;
    var hand = CardGame_getHand(owner);
    var cardType = hand.getCard(cardIndex);
    var card = new cardType(owner);
    var cardCost = card.getCost();

    if (currentEvilPoints < cardCost) {
      // Can't pay, so we can't play the card.
      continuation.call();
      return;
    }

    var destination;
    if (card.isMinion()) {
      destination = CardGame_getMinionRow(owner);
    } else {
      destination = CardGame_getOngoingRow(owner);
    }
    var action = new NullAction()
      .chain(new ModifyEvilPointsAction(owner, - cardCost))
      .chain(new PlayCardFromHandAction(owner, cardIndex, card, destination))
      .chain(card.onPlayed());

    if (!card.isOngoing()) {
      action = action.chain(new SendCardToDiscardAction(owner, card));
    }

    action.perform(continuation);
  }
}

function BetweenTurnsAction() : Action() constructor {
  __actionType = "BetweenTurnsAction";

  static perform = function(continuation) {
    ctrl_CardGameManager.turnNumber++;
    continuation.call();
  }
}

function ContinueEnemyTurnAction() : Action() constructor {
  __actionType = "ContinueEnemyTurnAction";

  static perform = function(continuation) {
    var ai = ctrl_CardGameManager.enemyAi;
    var nextCardIndex = ai.chooseNextCardToPlay();
    if (is_undefined(nextCardIndex)) {
      continuation.call();
    } else {
      var action = new NullAction()
          .chain(new DelayAction(30))
          .chain(CardGame_Action_playCard(CardPlayer.RIGHT, nextCardIndex))
          .chain(self);
      action.perform(continuation);
    }
  }
}

function PowerUpArchetypesAction(effectOwner_, archetype_, amount_ = 1) : Action() constructor {
  __actionType = "PowerUpArchetypesAction";
  effectOwner = effectOwner_;
  archetype = archetype_;
  amount = amount_;

  static perform = function(continuation) {
    var allCards = CardGame_allCardsInPlay();
    for (var i = 0; i < array_length(allCards); i++) {
      var card = allCards[i];
      if (is_instanceof(card, MinionCard) && array_contains(card.getArchetypes(), archetype)) {
        if (!CardGame_isImmuneTo(effectOwner, card)) {
          card.modifyLevel(amount);
          doTextAnimation(getCardX(card), getCardY(card), 1);
        }
      }
    }
    continuation.call();
  }
}

// Can only be used with TimedOngoingCards.
function IncreaseTurnCounterAction(card_) : Action() constructor {
  __actionType = "IncreaseTurnCounterAction";
  card = card_;

  static perform = function(continuation) {
    card.turnCounter++;
    if (card.turnCounter > card.totalTurns) {
      new SendCardToDiscardAction(card.owner, card).perform(continuation);
    } else {
      continuation.call();
    }
  }
}

function EndCardGameAction(winner_) : Action() constructor {
  winner = winner_;

  static perform = function(continuation) {
    // Roll spoils
    var moneyEarned = 0;
    var cardsEarned = [];
    var challenger = global.__CardGame_fieldProfile.challenger;
    if (winner == CardPlayer.LEFT) {
      // TODO Bonus challenges
      moneyEarned = challenger.rollMoneyReward();
      cardsEarned = challenger.rollRegularReward();
      challenger.markAsBeaten();
    } else {
      challenger.markAsLostTo();
    }

    // Give the player the rewards
    global.playerMoney += moneyEarned;
    for (var i = 0; i < array_length(cardsEarned); i++) {
      array_push(global.playerTrunk, cardsEarned[i]);
    }

    with (instance_create_layer(room_width / 2, room_height / 2, "Instances_BackUI", obj_EndOfGameScreen)) {
      playerWins = (other.winner == CardPlayer.LEFT);
      moneySpoils = moneyEarned;
      cardSpoils = cardsEarned;
    }
  }
}
