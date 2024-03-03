
function CardRhombus(owner_) : MinionCard(owner_, 2, 1) constructor {

  static getId = function() {
    return 5;
  }

  static getName = function() {
    return "Rhombus Ranger";
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
    return 6;
  }

  static getText = function() {
    return "A member of the Icosaking's archery division. They say he can hit a mirror crystal at 100 paces.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.SHAPE];
  }

}
