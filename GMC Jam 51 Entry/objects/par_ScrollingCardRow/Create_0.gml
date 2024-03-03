
// Note: This list can be shared with global variables, and
// modifications to one will affect the other.
cards = [];

text = "";

anchorX = room_width / 2;
isDragging = false;
dragStartX = 0;


cardX = function(idx) {
  return anchorX + idx * CARD_WIDTH * 0.25 * 1.35;
}

cardY = function(idx) {
  return y;
}

isInBelt = function(xx, yy) {
  var top = y - CARD_HEIGHT * 0.25 * 0.6;
  var bottom = y + CARD_HEIGHT * 0.25 * 0.9;
  return yy >= top && yy <= bottom;
}

overlappingCard = function(xx, yy) {
  for (var i = 0; i < array_length(cards); i++) {
    if ((abs(xx - cardX(i)) <= CARD_WIDTH * 0.25 * 0.5) && (abs(yy - cardY(i)) <= CARD_HEIGHT * 0.25 * 0.5)) {
      return i;
    }
  }
  return undefined;
}

getActionButton = function(idx) {
  return undefined;
}