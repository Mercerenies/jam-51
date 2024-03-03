
if (isDragging) {
  anchorX = mouse_x - dragStartX;
  var maxbound = room_width / 2;
  var minbound = maxbound - CARD_WIDTH * 0.25 * 1.35 * (array_length(cards) - 1);
  anchorX = clamp(anchorX, minbound, maxbound);
}