
function CardMushroom(owner_) : MinionCard(owner_, 1, 1) constructor {

  static getId = function() {
    return 1;
  }

  static getName = function() {
    return "Mushroom Man";
  }

  static getCost = function() {
    return 1;
  }

  static getMoneyCost = function() {
    return 2;
  }

  static getRarity = function() {
    return Rarity.COMMON;
  }

  static getImageIndex = function() {
    return 1;
  }

  static getText = function() {
    return "An adorable little mushroom. It doesn't look too threatening.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.NATURE];
  }

}
