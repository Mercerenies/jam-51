
if (!CardGame_canPlayerInteract()) {
  exit;
}

if (overlaps(mouse_x, mouse_y)) {
  CardGame_showCardList([card]);
}
