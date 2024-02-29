
function CardMushroom() : MinionCard(1, 1) constructor {

  static getName = function() {
    return "Mushroom";
  }

  static getCost = function() {
    return 1;
  }

  static getRarity = function() {
    return Rarity.COMMON;
  }

  static getImageIndex = function() {
    return 0; // TODO
  }

  static getText = function() {
    return ""; // TODO
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.FUNGUS];
  }

}
