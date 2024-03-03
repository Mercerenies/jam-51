
function CardMaskedTurtle(owner_) : MinionCard(owner_, 2, 2) constructor {

  static getId = function() {
    return 25;
  }

  static getName = function() {
    return "Masked Turtle";
  }

  static getCost = function() {
    return 4;
  }

  static getMoneyCost = function() {
    return 8;
  }

  static getRarity = function() {
    return Rarity.UNCOMMON;
  }

  static getImageIndex = function() {
    return 26;
  }

  static getText = function() {
    return "Some of the turtles were self-conscious, but the mask helps them concentrate on being an evil Minion.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.TURTLE];
  }

}
