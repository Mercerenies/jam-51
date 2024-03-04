
function CardMiddleManager(owner_) : MinionCard(owner_, 3, 2) constructor {

  static getId = function() {
    return 34;
  }

  static getName = function() {
    return "Middle Manager";
  }

  static getCost = function() {
    return 6;
  }

  static getMoneyCost = function() {
    return 12;
  }

  static getRarity = function() {
    return Rarity.UNCOMMON;
  }

  static getImageIndex = function() {
    return 35;
  }

  static getText = function() {
    return "He's never off the clock. They say he sleeps with his work phone, just in case of emergency.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.HUMAN];
  }

}
