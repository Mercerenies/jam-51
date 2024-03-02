
draw_set_color(c_black);
draw_set_alpha(alpha);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1.0);

image_index = (playerWins ? 1 : 0);
draw_self();

// Draw condition checkboxes
var xx = x - 261;
var yy = y - 139;

for (var i = 0; i < MAX_PLAYER_CONDITIONS; i++) {
  // TODO These for real
  draw_sprite(spr_Checkbox, 0, xx, yy);
  yy += 25;
}

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