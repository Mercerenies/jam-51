
// Actions which can be enqueued onto the actions queue.

// Abstract base class
function Action() constructor {
  static perform = function() {
    // Abstract method
  }
}

// Does not check hand limit. If deck is empty, does nothing.
function DrawCardPrimitiveAction(owner_) constructor {
  owner = owner_;

  static perform = function() {
    var deck = CardGame_getDeck(owner);
    var top = deck.popCard();
    if (!is_undefined(top)) {
      var hand = CardGame_getHand(owner);
      var dest_x = mean(hand.bbox_left, bbox_right);
      var dest_y = mean(hand.bbox_top, bbox_bottom);
      with (instance_create_layer(deck.x, deck.y, "Instances_UI", obj_MoveCardAnimation)) {
        card = new DeckIcon();
        target_x = dest_x;
        target_y = dest_y;
        callback = new DrawCardPrimitiveAction_Callback(hand, top);
      }
    }
  }

}

function DrawCardPrimitiveAction_Callback(hand_, card_) {
  hand = hand_;
  card = card_;

  static call = function() {
    hand.appendCard(card);
  }

}

// High-level DrawCard action, checks hand and deck. Reshuffles
// discard if necessary.
function DrawCardAction(owner_) constructor {
  owner = owner_;

  static perform = function() {
    // If the player's hand limit has been met, do not draw.
    var hand = CardGame_getHand(owner);
    var handLimit = CardGame_getStats(owner).handLimit;
    if (hand.cardCount() >= handLimit) {
      CardGame_finishAction();
      return;
    }

    // If the deck is empty and the discard pile is not, then trigger a
    // reshuffle. If both are empty, abort the draw action.
    var deck = CardGame_getDeck(owner);
    var discard = CardGame_getDiscardPile(owner);
    if (deck.isEmpty()) {
      if (discard.isEmpty()) {
        CardGame_finishAction();
        return;
      }
      CardGame_reshuffleDiscard(owner);
    }

    // Now draw a card.
    CardGame_enqueue(new DrawCardPrimitiveAction(owner));
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
