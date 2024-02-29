
function CardGame_showingModal() {
  return instance_exists(par_CardGameModal);
}

function CardGame_showCardList(cards_array, show_empty_icon_if_empty = true) {
  if ((array_length(cards_array) == 0) && (show_empty_icon_if_empty)) {
    cards_array = [new BlankIcon()];
  }
  with (instance_create_layer(0, 0, "Instances_UI", obj_CardListModal)) {
    cards = cards_array;
  }
}
