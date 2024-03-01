
var xx = room_width / 2 + scrollAmount;
var yy = room_height / 2;

draw_set_color(c_black);
draw_set_alpha(0.75);
draw_rectangle(0, yy - CARD_HEIGHT * 0.6, room_width, yy + CARD_HEIGHT * 0.7, false);
draw_set_alpha(1.0);

for (var i = 0; i < array_length(cards); i++) {
  var card = cards[i];
  drawCard(card, xx, yy, 1, 1, 0, c_white, 1);
  xx += CARD_WIDTH * 1.25;
}

if (!is_undefined(button)) {
  var xx = buttonX();
  var yy = buttonY();
  var image_idx = 0;
  if ((!button.isDisabled()) && overlapsButton(mouse_x, mouse_y)) {
    if (isClickingActionButton) {
      image_idx = 2;
    } else {
      image_idx = 1;
    }
  }
  draw_sprite(spr_BlueButton, image_idx, xx, yy);
  draw_set_font(fnt_GeneralUI);
  draw_set_color((image_idx == 2) ? c_white : c_black);
  draw_set_halign(fa_center);
  draw_set_valign(fa_middle);
  draw_text(xx, yy, button.buttonText());
  draw_set_halign(fa_left);
  draw_set_valign(fa_top);
}
