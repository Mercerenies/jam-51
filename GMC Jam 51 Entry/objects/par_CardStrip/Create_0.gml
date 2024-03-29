
event_inherited();

cardCenterX = function(index) {
  return lerp(bbox_left, bbox_right, (index + 1) / (array_length(cards) + 1));
}

cardCenterY = function(index) {
  return mean(bbox_top, bbox_bottom);
}

getCardToShow = function(index) {
  if (isHidden()) {
    return new DeckIcon();
  } else {
    return cards[index];
  }
}

actionButtonForCard = function(index) {
  // Should return either undefined (for no button) or a
  // CardListModalButton instance. Shows the button on the
  // popup when a card is clicked.
  return undefined;
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

searchCard = function(card) {
  for (var i = 0; i < cardCount(); i++) {
    var currCard = getCard(i);
    if (currCard == card) {
      return i;
    }
  }
  return undefined;
}
