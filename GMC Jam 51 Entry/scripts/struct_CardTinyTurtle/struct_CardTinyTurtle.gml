
function CardTinyTurtle(owner_) : MinionCard(owner_, 1, 2) constructor {

  static getId = function() {
    return 24;
  }

  static getName = function() {
    return "Tiny Turtle";
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
    return 25;
  }

  static getText = function() {
    return "A little turtle who wouldn't hurt a fly. He doesn't work for money. He just wants a big hug.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.TURTLE];
  }

}
