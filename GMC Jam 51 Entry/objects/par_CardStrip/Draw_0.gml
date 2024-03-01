
var yy = mean(bbox_top, bbox_bottom);

var rot = 0;
if (shouldBeRotated()) {
  rot = 180;
}

for (var i = 0; i < array_length(cards); i++) {
  var card = getCardToShow(i);
  var xx = cardCenterX(i);
  drawCard(card, xx, yy, 0.25, 0.25, rot, c_white, 1);
  drawAtopCard(card, xx, yy);
}

// Draw highlighted card larger
var highlightIndex = overlappingCard(mouse_x, mouse_y);
if ((!is_undefined(highlightIndex)) && CardGame_canPlayerInteract()) {
  var card = getCardToShow(highlightIndex);
  var xx = cardCenterX(highlightIndex);
  drawCard(card, xx, yy, 0.25 * 1.2, 0.25 * 1.2, rot, c_white, 1);
  drawAtopCard(card, xx, yy);
}
