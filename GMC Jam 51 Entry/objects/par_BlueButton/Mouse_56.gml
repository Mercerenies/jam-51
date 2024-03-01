
if (clicking && (position_meeting(mouse_x, mouse_y, self)) && CardGame_canPlayerInteract()) {
  onClick();
}

clicking = false;