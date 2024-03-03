
draw_set_color(c_black);
draw_set_alpha(0.75);
draw_rectangle(0, y - CARD_HEIGHT * 0.25 * 0.6, room_width, y + CARD_HEIGHT * 0.25 * 0.9, false);
draw_set_alpha(1.0);

var overlappingIndex = overlappingCard(mouse_x, mouse_y);
for (var i = 0; i < array_length(cards); i++) {
  var card = cards[i];
  var scale = 0.25;
  if (overlappingIndex == i) {
    scale *= 1.2;
  }
  drawCard(card, cardX(i), cardY(i), scale, scale, 0, c_white, 1);
}

draw_set_color(c_black);
draw_set_font(fnt_GeneralUI);
draw_text(16, bbox_top - 32, text);