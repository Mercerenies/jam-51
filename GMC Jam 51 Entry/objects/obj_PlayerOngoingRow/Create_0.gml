
// Instance variable: owner (CardPlayer constant)

// Takes card instances in the cards array.

event_inherited();

shouldBeRotated = function() {
  return (owner == CardPlayer.RIGHT);
}

drawAtopCard = function(card, xx, yy) {
  var overlay = card.overlayText();
  if (!is_undefined(overlay)) {
    var textY = yy + 0.3 * 0.25 * CARD_HEIGHT;
    CardGame_drawOverlayText(xx, textY, overlay);
  }
}
