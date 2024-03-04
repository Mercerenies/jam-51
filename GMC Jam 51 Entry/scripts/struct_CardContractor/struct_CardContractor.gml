
function CardContractor(owner_) : MinionCard(owner_, 2, 2) constructor {

  static getId = function() {
    return 33;
  }

  static getName = function() {
    return "Contractor";
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
    return 34;
  }

  static getText = function() {
    return "They're cheaper than real employees, and you don't have to cover their dental plan. It's win-win!";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.HUMAN];
  }

}
