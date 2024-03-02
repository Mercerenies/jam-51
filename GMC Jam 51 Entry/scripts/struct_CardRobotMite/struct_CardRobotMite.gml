
function CardRobotMite(owner_) : MinionCard(owner_, 1, 1) constructor {

  static getId = function() {
    return 20;
  }

  static getName = function() {
    return "Robot Mite";
  }

  static getCost = function() {
    return 1;
  }

  static getRarity = function() {
    return Rarity.COMMON;
  }

  static getImageIndex = function() {
    return 21;
  }

  static getText = function() {
    return "A cute little robot bug, powered by several raspberries. Or something like that.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.ROBOT];
  }

}
