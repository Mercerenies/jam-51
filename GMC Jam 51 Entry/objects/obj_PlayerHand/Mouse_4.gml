
if (CardGame_showingModal()) {
  exit;
}

var highlightedIndex = overlappingCard(mouse_x, mouse_y);
if (!is_undefined(highlightedIndex)) {
  var popupCards = [getCardToShow(highlightedIndex)];
  CardGame_showCardList(popupCards);
}
