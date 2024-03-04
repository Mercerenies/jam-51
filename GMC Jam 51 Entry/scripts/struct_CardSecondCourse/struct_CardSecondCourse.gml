
function CardSecondCourse(owner_) : TimedOngoingCard(owner_, 4) constructor {

  static getId = function() {
    return 23;
  }

  static getName = function() {
    return "Second Course";
  }

  static getCost = function() {
    return 1;
  }

  static getMoneyCost = function() {
    return 6;
  }

  static getRarity = function() {
    return Rarity.UNCOMMON;
  }

  static getImageIndex = function() {
    return 84;
  }

  static getText = function() {
    return "Ongoing: Hand Limit +1, lasts 4 turns";
  }

  static isOngoing = function() {
    return true;
  }

  static getHandModifier = function() {
    return 1;
  }

}
