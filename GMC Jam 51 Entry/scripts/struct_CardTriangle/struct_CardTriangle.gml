
function CardTriangle(owner_) : MinionCard(owner_, 1, 1) constructor {

  static getId = function() {
    return 8;
  }

  static getName = function() {
    return "Triangle Trooper";
  }

  static getMoneyCost = function() {
    return 2;
  }

  static getCost = function() {
    return 1;
  }

  static getRarity = function() {
    return Rarity.COMMON;
  }

  static getImageIndex = function() {
    return 4;
  }

  static getText = function() {
    return "One of the Icosaking's footsoldiers. They're untrained, but don't underestimate their strength in numbers.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.SHAPE];
  }

}
