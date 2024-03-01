
// Inherit the parent event
event_inherited();

text = "End Turn";

onClick = function() {
  // Player end turn -> enemy start turn
  var action = new NullAction()
    .chain(CardGame_Action_endTurn(CardPlayer.LEFT))
    .chain(CardGame_Action_startTurn(CardPlayer.RIGHT))
    .chain(CardGame_Action_enemyTurn());
  CardGame_runAction(action);
}
