
function CardBee(owner_) : MinionCard(owner_, 1, 1) constructor {

  static getId = function() {
    return 17;
  }

  static getName = function() {
    return "Busy Bee";
  }

  static getCost = function() {
    return 1;
  }

  static getRarity = function() {
    return Rarity.COMMON;
  }

  static getImageIndex = function() {
    return 18;
  }

  static getText = function() {
    return "Busy bee buzzing blissfully between blooming blossoms.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.BEE];
  }

}
