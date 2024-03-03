
function CardRavioli(owner_) : MinionCard(owner_, 1, 1) constructor {

  static getId = function() {
    return 27;
  }

  static getName = function() {
    return "Ravioli Runt";
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
    return 28;
  }

  static getText = function() {
    return "Calling him a \"runt\" is a great way to get kicked in the lasagna.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.PASTA];
  }

}
