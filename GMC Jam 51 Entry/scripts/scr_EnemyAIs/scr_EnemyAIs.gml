
// Abstract base class
function EnemyAI() constructor {
  static chooseNextCardToPlay = function() {
    // Abstract method. Returns an index in the hand, or
    // undefined if we're done.
    return undefined;
  }
}

// Enemy AI that does nothing, just for testing.
function NullaryEnemyAI() : EnemyAI() constructor {
  static chooseNextCardToPlay = function() {
    return undefined;
  }
}

// Eager enemy AI, chooses random cards to play until he can't
// anymore.
function EagerEnemyAI() : EnemyAI() constructor {
  static chooseNextCardToPlay = function() {
    var evilPoints = CardGame_getStats(CardPlayer.RIGHT).evilPoints;
    var hand = CardGame_getHand(CardPlayer.RIGHT);
    var candidates = [];
    for (var i = 0; i < hand.cardCount(); i++) {
      var cardType = hand.getCard(i);
      var tmpCard = new cardType();
      if (tmpCard.getCost() <= evilPoints) {
        array_push(candidates, i);
      }
    }
    if (array_length(candidates) > 0) {
      return arrayRandom(candidates);
    } else {
      return undefined;
    }
  }
}
