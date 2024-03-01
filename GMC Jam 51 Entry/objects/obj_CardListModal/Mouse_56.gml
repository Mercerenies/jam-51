
if (overlapsButton(mouse_x, mouse_y) && isClickingActionButton) {
  if (button.closesModalOnClick()) {
    instance_destroy();
  }
  button.onClick();
}
isClickingActionButton = false;
isDragging = false;
