
if (isDragging) {
  var originalAnchorX = anchorX;
  anchorX = mouse_x - dragStartX;
  var maxbound = room_width / 2;
  var minbound = maxbound - CARD_WIDTH * 0.25 * 1.35 * (array_length(cards) - 1);
  // "Ratcheting" behavior so that if we're past the bounds, we can
  // only scroll toward the bounds, not away.
  if ((anchorX <= originalAnchorX) && (originalAnchorX <= minbound)) {
    anchorX = originalAnchorX;
  }
  if ((anchorX >= originalAnchorX) && (originalAnchorX >= maxbound)) {
    anchorX = originalAnchorX;
  }
}
