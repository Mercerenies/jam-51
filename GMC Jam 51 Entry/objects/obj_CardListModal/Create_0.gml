
// Must be a list of card *instances*, not types.
cards = [];

scrollAmount = 0;

maxScrollAmount = function() {
  return CARD_WIDTH * 1.25 * max(0, array_length(cards) - 1);
}

isInBelt = function(xx, yy) {
  var top = room_height / 2 - CARD_HEIGHT * 0.6;
  var bottom = room_height / 2 + CARD_HEIGHT * 0.6;
  return yy >= top && yy <= bottom;
}

isDragging = false;
dragStartX = 0;

firstStep = true;