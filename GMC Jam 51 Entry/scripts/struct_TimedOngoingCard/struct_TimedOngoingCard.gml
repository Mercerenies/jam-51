
function TimedOngoingCard(owner_, totalTurns_) : EffectCard(owner_) constructor {
  totalTurns = totalTurns_;
  turnCounter = 1;

  static isOngoing = function() {
    return true;
  }

  static overlayText = function() {
    return "Turn " + string(turnCounter);
  }

  static onStandbyPhase = function() {
    // Returns an Action to run in the standby phase.
    return new IncreaseTurnCounterAction(self);
  }

}
