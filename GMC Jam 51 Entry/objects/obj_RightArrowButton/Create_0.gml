
event_inherited();

isDisabled = function() {
  var currIndex = par_ChooserIcon.currentIndex;
  return (currIndex >= par_ChooserIcon.getMaxChoice());
}

onClick = function() {
  par_ChooserIcon.scrollRight();
}
