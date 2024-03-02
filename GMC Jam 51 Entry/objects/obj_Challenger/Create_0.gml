
getChallenger = function() {
  var idx = ctrl_ChooseOpponentRoom.opponentIndex;
  return global.allChallengers[idx];
}

scrollLeft = function() {
  CardGame_runAction(new ScrollChallengerAction(-1));
}

scrollRight = function() {
  CardGame_runAction(new ScrollChallengerAction(1));
}

tick = 0;

animating = false;
animationStep = 0; // 0 = starting moving, 1 = ending moving
animatingDirection = 0;
animationFinishedCallback = new NullCallable();
