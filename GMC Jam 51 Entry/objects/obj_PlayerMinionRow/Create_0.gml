
// Instance variable: owner (CardPlayer constant)

// Takes card instances in the cards array. All card instances MUST be
// MinionCards.

event_inherited();

shouldBeRotated = function() {
  return (owner == CardPlayer.RIGHT);
}

drawAtopCard = function(card, xx, yy) {
  var stats = string(card.getLevel()) + " / " + string(card.getMorale());
  var textY = yy + 0.3 * 0.25 * CARD_HEIGHT;
  CardGame_drawOverlayText(xx, textY, stats);
}
