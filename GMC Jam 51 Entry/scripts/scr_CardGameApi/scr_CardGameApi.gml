
// Higher-level API for card effects and actions that can be performed
// in the game.

function CardGame_drawCard(owner) {
  CardGame_enqueue(new DrawCardAction(owner));
}


function CardGame_reshuffleDiscard(owner) {
  CardGame_enqueue(new ReshuffleDiscardAction(owner));
}
