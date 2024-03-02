
event_inherited();

isDisabled = function() {
  var currIndex = ctrl_ChooseOpponentRoom.opponentIndex;
  return (currIndex >= ctrl_ChooseOpponentRoom.opponentCount() - 1);
}

onClick = function() {
  obj_Challenger.scrollRight();
}
