
var nextCard = ai.chooseNextCardToPlay();
if (is_undefined(nextCard)) {
  endEnemyTurn();
  instance_destroy();
} else {
  var action = new NullAction()
    .chain(CardGame_Action_endTurn(CardPlayer.LEFT))
    .chain(CardGame_Action_startTurn(CardPlayer.RIGHT));
  CardGame_runAction(action);
}
