
function CardTempWorker(owner_) : MinionCard(owner_, 1, 2) constructor {

  static getId = function() {
    return 31;
  }

  static getName = function() {
    return "Temp Worker";
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
    return 32;
  }

  static getText = function() {
    return "His spreadsheet powers are unmatched... for the next six to eight weeks anyway.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.HUMAN];
  }

}
