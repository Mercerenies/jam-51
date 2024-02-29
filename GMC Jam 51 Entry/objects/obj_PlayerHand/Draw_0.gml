

var yy = mean(bbox_top, bbox_bottom);

for (var i = 0; i < array_length(cards); i++) {
  var card = getCardToShow(i);
  var xx = cardCenterX(i);
  drawCard(card, xx, yy, 0.25, 0.25, 0, c_white, 1);
}

// Draw highlighted card larger
var highlightIndex = overlappingCard(mouse_x, mouse_y);
if (!is_undefined(highlightIndex)) {
  var card = getCardToShow(highlightIndex);
  var xx = cardCenterX(highlightIndex);
  drawCard(card, xx, yy, 0.25 * 1.2, 0.25 * 1.2, 0, c_white, 1);
}