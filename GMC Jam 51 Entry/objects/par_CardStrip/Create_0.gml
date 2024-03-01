
event_inherited();

cardCenterX = function(index) {
  return lerp(bbox_left, bbox_right, (index + 1) / (array_length(cards) + 1));
}

getCardToShow = function(index) {
  if (isHidden()) {
    return new DeckIcon();
  } else {
    return cards[index];
  }
}

overlappingCard = function(xx, yy) {
  if ((yy < bbox_top) || (yy > bbox_bottom)) {
    return undefined;
  }
  var best = undefined;
  var bestDistance = CARD_WIDTH * 0.25 / 2;
  for (var i = 0; i < array_length(cards); i++) {
    var centerX = cardCenterX(i);
    if (abs(centerX - xx) < bestDistance) {
      best = i;
      bestDistance = abs(centerX - xx);
    }
  }
  return best;
}

drawAtopCard = function(card, xx, yy) {
  // Default implementation is empty
}

isHidden = function() {
  return false;
}

shouldBeRotated = function() {
  return false;
}
