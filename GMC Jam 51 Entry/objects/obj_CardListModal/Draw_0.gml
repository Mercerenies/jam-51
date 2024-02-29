
var xx = room_width / 2 + scrollAmount;
var yy = room_height / 2;

draw_set_color(c_black);
draw_set_alpha(0.75);
draw_rectangle(0, yy - CARD_HEIGHT * 0.6, room_width, yy + CARD_HEIGHT * 0.6, false);
draw_set_alpha(1.0);

for (var i = 0; i < array_length(cards); i++) {
  var card = cards[i];
  drawCard(card, xx, yy, 1, 1, 0, c_white, 1);
  xx += CARD_WIDTH * 1.25;
}