
function CardPenneSharpshooter(owner_) : MinionCard(owner_, 2, 2) constructor {

  static getId = function() {
    return 36;
  }

  static getName = function() {
    return "Penne Sharpshooter";
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
    return 37;
  }

  static getText = function() {
    return "A sentient noodle with a keen eye and sharp aim. Nobody expects their pasta to be their assassin.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.PASTA];
  }

}
