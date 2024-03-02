
function CardSpareBattery(owner_) : EffectCard(owner_) constructor {

  static getId = function() {
    return 21;
  }

  static getName = function() {
    return "Spare Battery";
  }

  static getCost = function() {
    return 4;
  }

  static getRarity = function() {
    return Rarity.UNCOMMON;
  }

  static getImageIndex = function() {
    return 22;
  }

  static getText = function() {
    return "Instant: +1 Level and Morale to your most powerful ROBOT Minion.";
  }

  static isOngoing = function() {
    return false;
  }

  static onPlayed = function() {
    // Returns an Action which shall run when the card is first
    // played.
    return new HighlightCardAction(self)
      .chain(new SpareBatteryAction(owner))
  }

}

function SpareBatteryAction(owner_) : Action() constructor {
  owner = owner_;

  static perform = function(continuation) {
    var myMinions = CardGame_getMinionRow(owner).cards;
    var myRobots = array_filter(myMinions, function(minion) {
      return array_contains(minion.getArchetypes(), Archetype.ROBOT);
    });
    array_sort(myRobots, CardGame_orderByPower);
    if (array_length(myRobots) <= 0) {
      // Can't activate; no robots exist.
      continuation.call();
      return;
    }
    var robot = myRobots[array_length(myRobots) - 1];
    robot.modifyMorale(1);
    robot.modifyLevel(1);
    doTextAnimation(getCardX(robot), getCardY(robot), 1);
    doTextAnimation(getCardX(robot), getCardY(robot), 1);
    continuation.call();
  }
}
