
// Inherit the parent event
event_inherited();

text = "Challenge";

isDisabled = function() {
  var challenger = obj_Challenger.getChallenger();
  return challenger.isLocked();
}

onClick = function() {
  var challenger = obj_Challenger.getChallenger();
  var action = challenger.onChallenge();
  CardGame_runAction(action);
}
