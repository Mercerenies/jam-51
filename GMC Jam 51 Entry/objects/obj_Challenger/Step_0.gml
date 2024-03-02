
tick++;

var spd = 32;
if (animating) {
  var w = 260;
  x += animatingDirection * spd;
  if ((animatingDirection < 0) && (x < - w / 2)) {
    ctrl_ChooseOpponentRoom.opponentIndex++;
    x += room_width + w;
    animationStep = 1;
  } else if ((animatingDirection > 0) && (x > room_width + w / 2)) {
    ctrl_ChooseOpponentRoom.opponentIndex--;
    x -= room_width + w;
    animationStep = 1;
  } else if ((animationStep == 1) && (abs(x - xstart) <= spd)) {
    x = xstart;
    animating = false;
    animationFinishedCallback.call();
  }
}
