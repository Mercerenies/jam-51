
// Abstract base class
function SecondaryCondition(reward_) constructor {
  reward = reward_; // A card type

  static test = function() {
    // Abstract method
    return false;
  }

  static getText = function() {
    // Abstract method
    return "";
  }

}

function QDebugCondition(reward_) : SecondaryCondition(reward_) constructor {
  // This debug condition can be set by hitting the Q key at any
  // time during the game. This is, obviously, ONLY for debugging

  static test = function() {
    return obj_ConditionMonitor.qKeyPressed;
  }

  static getText = function() {
    return "Press the Q key [long text to see how much room we have]";
  }
}
