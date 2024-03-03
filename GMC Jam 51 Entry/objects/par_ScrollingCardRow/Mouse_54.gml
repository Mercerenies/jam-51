
var highlightIdx = overlappingCard(mouse_x, mouse_y);
if (!is_undefined(highlightIdx)) {
  var actionButton = getActionButton(highlightIdx);
  actionButton.onClick();
}
