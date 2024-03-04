
function CardUndeadPig(owner_) : MinionCard(owner_, 3, 2) constructor {

  static getId = function() {
    return 41;
  }

  static getName = function() {
    return "Undead Pig";
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
    return 41;
  }

  static getText = function() {
    return "This pig was brought back to life via the ancient practice of necromancy.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.UNDEAD];
  }

}
