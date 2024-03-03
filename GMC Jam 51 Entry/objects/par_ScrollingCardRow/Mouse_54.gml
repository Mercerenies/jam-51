
if (!CardGame_canPlayerInteract()) {
  exit;
}

var highlightIdx = overlappingCard(mouse_x, mouse_y);
if (!is_undefined(highlightIdx)) {
  var actionButton = getActionButton(highlightIdx);
  if ((!is_undefined(actionButton)) && (!actionButton.isDisabled())) {
    actionButton.onClick();
  }
}
