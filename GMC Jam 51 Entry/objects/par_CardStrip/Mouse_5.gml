
if (!CardGame_canPlayerInteract()) {
  exit;
}

var highlightedIndex = overlappingCard(mouse_x, mouse_y);
if (!is_undefined(highlightedIndex)) {
  var actionButton = actionButtonForCard(highlightedIndex);
  if ((!is_undefined(actionButton)) && (!actionButton.isDisabled())) {
    actionButton.onClick();
  }
}
