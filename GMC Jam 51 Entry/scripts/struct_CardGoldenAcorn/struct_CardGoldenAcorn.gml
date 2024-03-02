
function CardGoldenAcorn(owner_) : MinionCard(owner_, 8, 1) constructor {

  static getId = function() {
    return 19;
  }

  static getName = function() {
    return "Golden Acorn";
  }

  static getCost = function() {
    return 8;
  }

  static getRarity = function() {
    return Rarity.RARE;
  }

  static getImageIndex = function() {
    return 20;
  }

  static getText = function() {
    return "An extremely rare variant of the Corny Acorn. His jokes have the power to stop, and subsequently start, wars.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.NATURE];
  }

}
