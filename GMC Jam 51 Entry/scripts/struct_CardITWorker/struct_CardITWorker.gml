
function CardITWorker(owner_) : MinionCard(owner_, 2, 1) constructor {

  static getId = function() {
    return 32;
  }

  static getName = function() {
    return "IT Worker";
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
    return 33;
  }

  static getText = function() {
    return "Capable of solving any computer problem you've got. Just don't ask him to fix your printer.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.HUMAN];
  }

}
