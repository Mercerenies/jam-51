
function CardMeatball(owner_) : MinionCard(owner_, 1, 2) constructor {

  static getId = function() {
    return 28;
  }

  static getName = function() {
    return "Meatball Man";
  }

  static getCost = function() {
    return 2;
  }

  static getMoneyCost = function() {
    return 4;
  }

  static getRarity = function() {
    return Rarity.COMMON;
  }

  static getImageIndex = function() {
    return 29;
  }

  static getText = function() {
    return "That red hue is the marinara sauce dripping from his last victims.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.PASTA];
  }

}
