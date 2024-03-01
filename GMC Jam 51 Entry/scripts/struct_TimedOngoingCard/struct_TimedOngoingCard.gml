
function TimedOngoingCard(owner_, totalTurns_) : EffectCard(owner_) constructor {
  totalTurns = totalTurns_;
  turnCounter = 1;

  static isOngoing = function() {
    return true;
  }

  static overlayText = function() {
    return "Turn " + string(turnCounter);
  }

}
