
function CardGame_showingModal() {
  return instance_exists(par_CardGameModal);
}

function CardGame_canPlayerInteract() {
  if (CardGame_showingModal()) {
    return false;
  }
  return (!instance_exists(par_ActionsSemaphoreManager)) || (par_ActionsSemaphoreManager.actionsSemaphore <= 0);
}

function CardGame_showCardList(cards_array, button_ = undefined, show_empty_icon_if_empty = true) {
  if ((array_length(cards_array) == 0) && (show_empty_icon_if_empty)) {
    cards_array = [new BlankIcon()];
  }
  with (instance_create_layer(0, 0, "Instances_UI", obj_CardListModal)) {
    cards = cards_array;
    button = button_;
  }
}

function CardGame_drawOverlayText(xx, yy, text) {
  draw_set_font(fnt_GeneralUI);
  draw_set_color(COLOR_UI_GRAY);
  draw_set_halign(fa_center);
  draw_set_valign(fa_middle);

  var textwidth = string_width(text);
  var textheight = string_height(text);
  draw_rectangle(xx - textwidth / 2, yy - textheight / 2, xx + textwidth / 2, yy + textheight / 2, false);
  draw_set_color(c_white);
  draw_text(xx, yy, text);

  draw_set_halign(fa_left);
  draw_set_valign(fa_top);
}
