
function MinionCard(level_, morale_) : Card() constructor {
  // These are the stats shown on the card. Do not modify these after
  // construction.
  base_level = level_;
  base_morale = morale_;

  // These are the current in-game stats and can be changed. Both must
  // always be >= 0. Outside callers should use the instance methods,
  // which have additional safety checks, to get and set these.
  _level = level_;
  _morale = morale_;

  static isMinion = function() {
    return true;
  }

  static isOngoing = function() {
    return true;
  }

  static getArchetypes = function() {
    // Abstract method, returns list of Archetypes.
  }

}
