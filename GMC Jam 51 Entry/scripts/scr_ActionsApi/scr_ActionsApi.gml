
// Functions for interfacing with the actions queue. These must only
// be called from a room where ctrl_CardGameManager exists.

function CardGame_semaUp() {
  ctrl_CardGameManager.actionsSemaphore++;
}

function CardGame_semaDown() {
  ctrl_CardGameManager.actionsSemaphore--;
}

// Emergency reset switch. TODO If the game ends up hanging a lot,
// maybe put this on a function key and let players bail out
// themselves?
function CardGame_semaReset() {
  ctrl_CardGameManager.actionsSemaphore = 0;
}

function CardGame_runAction(action) {
  CardGame_semaUp();
  action.perform(
    new CardGame_SemaDownCallable(),
  );
}

function CardGame_SemaDownCallable() constructor {
  static call = function() {
    CardGame_semaDown();
  }
}
