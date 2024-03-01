
if (overlapsButton(mouse_x, mouse_y) && (!button.isDisabled())) {
  isClickingActionButton = true;
} else if (isInBelt(mouse_x, mouse_y)) {
  isDragging = true;
  dragStartX = mouse_x - scrollAmount;
} else if (!firstStep) { // Annoying sequencing because GM registers events from before an object was created
  instance_destroy();
}
