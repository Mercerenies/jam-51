
var xx = anchorX;
var yy = y;

draw_set_color(c_black);
draw_set_alpha(0.75);
draw_rectangle(0, yy - CARD_HEIGHT * 0.25 * 0.6, room_width, yy + CARD_HEIGHT * 0.25 * 0.6, false);
draw_set_alpha(1.0);

for (var i = 0; i < array_length(cards); i++) {
  var card = cards[i];
  drawCard(card, xx, yy, 0.25, 0.25, 0, c_white, 1);
  xx += CARD_WIDTH * 0.25 * 1.25;
}

draw_set_color(c_black);
draw_set_font(fnt_GeneralUI);
draw_text(16, bbox_top - 32, text);