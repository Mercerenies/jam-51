
event_inherited();

isDisabled = function() {
  var currIndex = ctrl_ChooseOpponentRoom.opponentIndex;
  return (currIndex <= 0);
}

onClick = function() {
  obj_Challenger.scrollLeft();
}
