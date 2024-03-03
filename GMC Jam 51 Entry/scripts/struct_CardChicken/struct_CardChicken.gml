
function CardChicken(owner_) : MinionCard(owner_, 1, 1) constructor {

  static getId = function() {
    return 29;
  }

  static getName = function() {
    return "Chicken";
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
    return 30;
  }

  static getText = function() {
    return "It's just a random chicken that some evil mastermind decided to send into battle. Most of them just wander off and look for seeds.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [];
  }

}
