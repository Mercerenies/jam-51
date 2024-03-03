
// Inherit the parent event
event_inherited();

text = "End Turn";

onClick = function() {
  // Player end turn -> enemy start turn

  var fieldInterrupt = global.__CardGame_fieldProfile.playerEndTurnInterrupt();
  if (!is_undefined(fieldInterrupt)) {
    CardGame_runAction(fieldInterrupt);
    return;
  }

  var action = new NullAction()
    .chain(CardGame_Action_endTurn(CardPlayer.LEFT))
    .chain(CardGame_Action_startTurn(CardPlayer.RIGHT))
    .chain(CardGame_Action_enemyTurn());
  CardGame_runAction(action);
}
