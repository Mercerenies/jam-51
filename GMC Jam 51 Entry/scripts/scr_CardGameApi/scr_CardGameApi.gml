
// Higher-level API for card effects and actions that can be performed
// in the game.

function CardGame_drawCards(owner, n) {
  return new DrawCardAction(owner).times(n);
}
