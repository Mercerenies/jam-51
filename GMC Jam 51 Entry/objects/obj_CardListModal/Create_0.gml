
// Must be a list of card *instances*, not types.
cards = [];

scrollAmount = 0;

// Must be either undefined or a CardListModalButton instance.
button = undefined;

maxScrollAmount = function() {
  return CARD_WIDTH * 1.25 * max(0, array_length(cards) - 1);
}

isInBelt = function(xx, yy) {
  var top = room_height / 2 - CARD_HEIGHT * 0.6;
  var bottom = room_height / 2 + CARD_HEIGHT * 0.7;
  return yy >= top && yy <= bottom;
}

buttonX = function() {
  return room_width / 2;
}

buttonY = function() {
  return room_height / 2 + CARD_HEIGHT * 0.6 + 8;
}

overlapsButton = function(xx, yy) {
  if (is_undefined(button)) {
    return false;
  }
  var w = sprite_get_width(spr_CardListModalButton);
  var h = sprite_get_height(spr_CardListModalButton);
  return (abs(xx - buttonX()) <= w / 2) && (abs(yy - buttonY()) <= h / 2);
}

isDragging = false;
dragStartX = 0;

isClickingActionButton = false;

firstStep = true;
