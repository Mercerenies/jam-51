
var image_idx = 0;
if ((!disabled) && (CardGame_canPlayerInteract()) && position_meeting(mouse_x, mouse_y, self)) {
  if (clicking) {
    image_idx = 2;
  } else {
    image_idx = 1;
  }
}
drawButton(x, y, text, image_idx);
