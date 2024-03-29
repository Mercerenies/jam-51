
function CardNuclear(owner_) : TimedOngoingCard(owner_, 4) constructor {

  static getId = function() {
    return 10;
  }

  static getName = function() {
    return "Nuclear Power Plant";
  }

  static getCost = function() {
    return 3;
  }

  static getMoneyCost = function() {
    return 10;
  }

  static getRarity = function() {
    return Rarity.UNCOMMON;
  }

  static getImageIndex = function() {
    return 11;
  }

  static getText = function() {
    return "Ongoing: +1 EP per turn, lasts 4 turns.";
  }

  static isOngoing = function() {
    return true;
  }

  static getEPModifier = function() {
    return 1;
  }

}
