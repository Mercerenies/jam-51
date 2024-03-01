
if (!CardGame_canPlayerInteract()) {
  exit;
}

var highlightedIndex = overlappingCard(mouse_x, mouse_y);
if (!is_undefined(highlightedIndex)) {
  var popupCards = [getCardToShow(highlightedIndex)];
  CardGame_showCardList(popupCards);
}
