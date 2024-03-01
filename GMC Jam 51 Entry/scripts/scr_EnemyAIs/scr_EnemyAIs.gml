
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