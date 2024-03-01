
// Invisible object for performing the enemy's turn via
// a particular enemy AI. Counts as a modal, as it blocks
// user input until done.

ai = global.__CardGame_enemyProfile.ai;

alarm[0] = 1;

endEnemyTurn = function() {
  // Enemy end turn -> player start turn
  var action = new NullAction()
    .chain(CardGame_Action_endTurn(CardPlayer.RIGHT))
    .chain(CardGame_Action_betweenTurns())
    .chain(CardGame_Action_startTurn(CardPlayer.LEFT));
  CardGame_runAction(action);
}
