
var highlightIdx = overlappingCard(mouse_x, mouse_y);
if (!is_undefined(highlightIdx)) {
  CardGame_showCardList([cards[highlightIdx]], getActionButton(highlightIdx));
} else if (isInBelt(mouse_x, mouse_y)) {
  isDragging = true;
  dragStartX = mouse_x - anchorX;
}
