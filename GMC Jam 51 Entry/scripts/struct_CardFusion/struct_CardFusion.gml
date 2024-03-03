
function CardFusion(owner_) : TimedOngoingCard(owner_, 6) constructor {

  static getId = function() {
    return 11;
  }

  static getName = function() {
    return "Nuclear Fusion Plant";
  }

  static getCost = function() {
    return 4;
  }

  static getMoneyCost = function() {
    return 14;
  }

  static getRarity = function() {
    return Rarity.RARE;
  }

  static getImageIndex = function() {
    return 12;
  }

  static getText = function() {
    return "Ongoing: +1 EP per turn, lasts 6 turns.";
  }

  static isOngoing = function() {
    return true;
  }

  static getEPModifier = function() {
    return 1;
  }

}
