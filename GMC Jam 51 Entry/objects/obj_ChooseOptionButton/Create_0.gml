
// Inherit the parent event
event_inherited();

// text variable in Variables

isDisabled = function() {
  var choice = par_ChooserIcon.getCurrentChoice();
  return choice.isLocked();
}

onClick = function() {
  var choice = par_ChooserIcon.getCurrentChoice();
  var action = choice.onChoose();
  CardGame_runAction(action);
}
