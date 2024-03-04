
function CardIntern(owner_) : MinionCard(owner_, 1, 1) constructor {

  static getId = function() {
    return 30;
  }

  static getName = function() {
    return "Unpaid Intern";
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
    return 31;
  }

  static getText = function() {
    return "Just three more years of experience and he'll be promoted to an unpaid temp worker.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.HUMAN];
  }

}
