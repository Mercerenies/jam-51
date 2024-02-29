
if (isDragging) {
  scrollAmount = mouse_x - dragStartX;
  scrollAmount = clamp(scrollAmount, - maxScrollAmount(), 0);
}