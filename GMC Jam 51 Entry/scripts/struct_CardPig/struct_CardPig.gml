
function CardPig(owner_) : MinionCard(owner_, 1, 2) constructor {

  static getId = function() {
    return 38;
  }

  static getName = function() {
    return "Pig";
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
    return 39;
  }

  static getText = function() {
    return "A classic, unmodified farm animal. Healthy and safe.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [];
  }

}
