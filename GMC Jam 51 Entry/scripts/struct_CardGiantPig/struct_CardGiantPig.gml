
function CardGiantPig(owner_) : MinionCard(owner_, 2, 1) constructor {

  static getId = function() {
    return 39;
  }

  static getName = function() {
    return "Giant Pig";
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
    return 40;
  }

  static getText = function() {
    return "A pig that was shot with a growth beam. The FDA does not approve of this practice, nor has it been studied.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [];
  }

}
