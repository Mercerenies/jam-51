
function CardBabyClown(owner_) : MinionCard(owner_, 1, 1) constructor {

  static getId = function() {
    return 42;
  }

  static getName = function() {
    return "Baby Clown";
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
    return 44;
  }

  static getText = function() {
    return "A very small number of babies are born with the unusual genetic defect of makeup and a red button nose.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.CLOWN];
  }

}
