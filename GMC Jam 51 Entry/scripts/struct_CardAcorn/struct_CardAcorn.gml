
function CardAcorn(owner_) : MinionCard(owner_, 1, 1) constructor {

  static getId = function() {
    return 18;
  }

  static getName = function() {
    return "Corny Acorn";
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
    return 19;
  }

  static getText = function() {
    return "His corny jokes will crack you right open. Right before he cracks your skull.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.NATURE];
  }

}
