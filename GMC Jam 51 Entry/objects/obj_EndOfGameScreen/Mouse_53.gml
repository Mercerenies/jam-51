
if (overlapsButton(mouse_x, mouse_y) && (!buttonIsDisabled())) {
  isClickingActionButton = true;
} else {
  var idx = overlappingCard(mouse_x, mouse_y);
  if (!is_undefined(idx)) {
    var popupCards = [cardSpoils[idx]];
    CardGame_showCardList(popupCards);
  }
}
