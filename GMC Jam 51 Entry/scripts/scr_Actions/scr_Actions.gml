
// Actions which can be run in the context of the game.

// Abstract base class. An action is defined to take a continuation
// parameter, which it MUST execute exactly once when done.
// Continuation must be an object with a nullary call().
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
function NullAction() constructor {
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
    var handLimit = CardGame_getStats(owner).handLimit;
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
      var dest_x = mean(hand.bbox_left, hand.bbox_right);
      var dest_y = mean(hand.bbox_top, hand.bbox_bottom);
      with (instance_create_layer(deck.x, deck.y, "Instances_UI", obj_MoveCardAnimation)) {
        card = new DeckIcon();
        target_x = dest_x;
        target_y = dest_y;
        callback = {
          hand: hand,
          card: top,
          continuation: continuation,
          call: function() {
            hand.appendCard(card);
            continuation.call();
          }
        };
      }
    }
  }
}

function ReshuffleDiscardAction(owner_) constructor {
  owner = owner_;

  static perform = function() {
    var deck = CardGame_getDeck(owner);
    var discard = CardGame_getDiscardPile(owner);
    var shuffledPile = arrayCopy(discard.cards);
    array_shuffle(shuffledPile);
    discard.clear();
    with (instance_create_layer(discard.x, discard.y, "Instances_UI", obj_MoveCardAnimation)) {
      card = new DeckIcon();
      target_x = deck.x;
      target_y = deck.y;
      callback = new ReshuffleDiscardAction_Callback(deck, shuffledPile);
    }
  }

}

function ReshuffleDiscardAction_Callback(deck_, shuffledPile_) constructor {
  deck = deck_;
  shuffledPile = shuffledPile_;

  static call = function() {
    deck.replaceCards(shuffledPile);
  }
}
