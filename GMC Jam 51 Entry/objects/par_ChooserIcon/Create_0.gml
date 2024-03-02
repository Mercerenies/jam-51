
currentIndex = 0;

getCurrentChoice = function() {
  // Abstract method
}

getMinChoice = function() {
  return 0;
}

getMaxChoice = function() {
  // Abstract method
}

scrollLeft = function() {
  CardGame_runAction(new ScrollChooserAction(-1));
}

scrollRight = function() {
  CardGame_runAction(new ScrollChooserAction(1));
}

tick = 0;

animating = false;
animationStep = 0; // 0 = starting moving, 1 = ending moving
animatingDirection = 0;
animationFinishedCallback = new NullCallable();
