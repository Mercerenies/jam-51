
var highlightIdx = overlappingCard(mouse_x, mouse_y);
if (!is_undefined(highlightIdx)) {
  CardGame_showCardList([cards[highlightIdx]]); // TODO Action Button
} else if (isInBelt(mouse_x, mouse_y)) {
  isDragging = true;
  dragStartX = mouse_x - anchorX;
}
