
function CardCircle(owner_) : MinionCard(owner_, 3, 2) constructor {

  static getId = function() {
    return 6;
  }

  static getName = function() {
    return "Captain Circle";
  }

  static getCost = function() {
    return 6;
  }

  static getRarity = function() {
    return Rarity.UNCOMMON;
  }

  static getImageIndex = function() {
    return 8;
  }

  static getText = function() {
    return "A high-ranking military officer. The circles are often regarded as the most logical and strategic soldiers.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.SHAPE];
  }

}
