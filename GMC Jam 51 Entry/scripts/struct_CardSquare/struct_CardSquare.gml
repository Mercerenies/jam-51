
function CardSquare(owner_) : MinionCard(owner_, 1, 2) constructor {

  static getId = function() {
    return 7;
  }

  static getName = function() {
    return "Sergeant Square";
  }

  static getCost = function() {
    return 2;
  }

  static getRarity = function() {
    return Rarity.COMMON;
  }

  static getImageIndex = function() {
    return 5;
  }

  static getText = function() {
    return "A veteran soldier in the Icosaking's army. His resilience is unmatched by his peers.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.SHAPE];
  }

}
