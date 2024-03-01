
// Actions which can be run in the context of the game.

// Abstract base class. An action is defined to take a continuation
// parameter, which it MUST execute exactly once when done.
// Continuation must be an object with a nullary call().
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
  static perform = function(continuation) {
    continuation.call();
  }
}

function ChainedAction(first_, second_) : Action() constructor {
  first = first_;
  second = second_;

  static perform = function(continuation) {
    first.perform({
      continuation: continuation,
      second: second,
      call: function() {
        second.perform(continuation);
      },
    });
  }

}

// Just a repeated chain N times, but implemented as its own class for
// efficiency.
function RepeatedAction(action_, times_) : Action() constructor {
  action = action_;
  times = times_;

  static perform = function(continuation) {
    if (times < 0) {
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

function ReshuffleDiscardAction(owner_) : Action() constructor {
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
  time = time_;

  static perform = function(continuation) {
    with (instance_create_layer(0, 0, "Instances_UI", obj_DelayAnimation)) {
      time = other.time;
      callback = continuation;
    }
  }
}

function SetEvilPointsAction(owner_, newPoints_) : Action() constructor {
  owner = owner_;
  newPoints = newPoints_;

  static perform = function(continuation) {
    CardGame_getStats(owner).evilPoints = newPoints;
    continuation.call();
  }
}
