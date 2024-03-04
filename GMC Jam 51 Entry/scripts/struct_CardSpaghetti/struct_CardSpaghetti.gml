
function CardSpaghetti(owner_) : MinionCard(owner_, 3, 2) constructor {

  static getId = function() {
    return 37;
  }

  static getName = function() {
    return "Spaghetti Monster";
  }

  static getCost = function() {
    return 6;
  }

  static getMoneyCost = function() {
    return 12;
  }

  static getRarity = function() {
    return Rarity.UNCOMMON;
  }

  static getImageIndex = function() {
    return 38;
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
