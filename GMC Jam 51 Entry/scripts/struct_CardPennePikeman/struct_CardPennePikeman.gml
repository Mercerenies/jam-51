
function CardPennePikeman(owner_) : MinionCard(owner_, 2, 1) constructor {

  static getId = function() {
    return 35;
  }

  static getName = function() {
    return "Penne Pikeman";
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
    return 36;
  }

  static getText = function() {
    return "Nobody knows how he manages to hold the pike. Few have survived seeing it though.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.PASTA];
  }

}
