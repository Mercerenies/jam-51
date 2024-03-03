
draw_set_color(c_black);
draw_set_alpha(alpha);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1.0);

image_index = (playerWins ? 1 : 0);
draw_self();

draw_set_font(fnt_GeneralUI);
draw_set_color(c_black);

// Draw condition checkboxes
var xx = x - 261;
var yy = y - 139;
for (var i = 0; i < array_length(conditions); i++) {
  var checkboxIdx = (conditionsMask[i] ? 1 : 0);
  draw_sprite(spr_Checkbox, checkboxIdx, xx, yy);
  draw_text(xx + 28, yy - 10, conditions[i].getText());
  yy += 28;
}

// Draw "Spoils" header
yy = y - 16;
draw_text(xx + 24, yy, "Your Spoils:");

// Draw Money Earned
yy = y + 32;
draw_sprite(spr_CardIcons, DOLLARS_ICON_INDEX, xx, yy);
draw_text(xx + 24, yy - 12, "+" + string(moneySpoils));

// Draw Cards Earned
var overlapping = overlappingCard(mouse_x, mouse_y);
for (var i = 0; i < array_length(cardSpoils); i++) {
  xx = cardX(i);
  yy = cardY(i);
  var scale = (overlapping == i ? 0.25 * 1.2 : 0.25);
  drawCard(cardSpoils[i], xx, yy, scale, scale, 0, c_white, 1);
}

// Draw "Continue" button
var xx = buttonX();
var yy = buttonY();
var image_idx = 0;
if ((!buttonIsDisabled()) && overlapsButton(mouse_x, mouse_y)) {
  if (isClickingActionButton) {
    image_idx = 2;
  } else {
    image_idx = 1;
  }
}
drawButton(xx, yy, "Continue", image_idx);
