
if (CardGame_canPlayerInteract()) {
  var cards_list = array_map(cards, function() { return new DeckIcon(); });
  CardGame_showCardList(cards_list);
}
