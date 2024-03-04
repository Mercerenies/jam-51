
function CardToddlerClown(owner_) : MinionCard(owner_, 1, 2) constructor {

  static getId = function() {
    return 43;
  }

  static getName = function() {
    return "Toddler Clown";
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
    return 45;
  }

  static getText = function() {
    return "And you think the terrible twos are bad for regular toddlers...";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.CLOWN];
  }

}
