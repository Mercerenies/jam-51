
function CardSpikyMushroom(owner_) : MinionCard(owner_, 1, 2) constructor {

  static getId = function() {
    return 3;
  }

  static getName = function() {
    return "Spiky Mushroom Man";
  }

  static getCost = function() {
    return 2;
  }

  static getRarity = function() {
    return Rarity.COMMON;
  }

  static getImageIndex = function() {
    return 3;
  }

  static getText = function() {
    return "A cute little mushroom with a spiky helmet. They say the helmet improves morale.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.NATURE];
  }

}
