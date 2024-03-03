
enterMainGame = function() {
  if (global.isFirstPlay) {
    global.isFirstPlay = false;
    var tutorialChallenger = global.allChallengers[0];
    CardGame_runAction(tutorialChallenger.onChoose());
  } else {
    room_goto(rm_ChooseLocation);
  }
}
