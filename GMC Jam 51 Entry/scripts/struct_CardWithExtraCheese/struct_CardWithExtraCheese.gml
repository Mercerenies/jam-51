
function CardWithExtraCheese(owner_) : TimedOngoingCard(owner_, 2) constructor {

  static getId = function() {
    return 23;
  }

  static getName = function() {
    return "With Extra Cheese";
  }

  static getCost = function() {
    return 1;
  }

  static getRarity = function() {
    return Rarity.UNCOMMON;
  }

  static getImageIndex = function() {
    return 24;
  }

  static getText = function() {
    return "Ongoing: Draw one extra card per turn, lasts 2 turns.";
  }

  static isOngoing = function() {
    return true;
  }

  static getDrawModifier = function() {
    return 1;
  }

}
