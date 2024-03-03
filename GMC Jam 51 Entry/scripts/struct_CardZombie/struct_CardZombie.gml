
function CardZombie(owner_) : MinionCard(owner_, 1, 1) constructor {

  static getId = function() {
    return 16;
  }

  static getName = function() {
    return "Zesty Zombie";
  }

  static getCost = function() {
    return 2;
  }

  static getMoneyCost = function() {
    return 3;
  }

  static getRarity = function() {
    return Rarity.COMMON;
  }

  static getImageIndex = function() {
    return 17;
  }

  static getText = function() {
    return "He's not unreasonable. I mean, no one's gonna eat your eyes.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.UNDEAD];
  }

}
