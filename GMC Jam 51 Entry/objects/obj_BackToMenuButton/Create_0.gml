
// Inherit the parent event
event_inherited();

// text and targetRoom variables in Variables

isDisabled = function() {
  return false;
}

onClick = function() {
  var action = new RoomGotoAction(targetRoom)
  CardGame_runAction(action);
}
