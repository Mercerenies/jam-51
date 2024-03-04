
function CardMilkman(owner_) : MinionCard(owner_, 2, 4) constructor {

  static getId = function() {
    return 47;
  }

  static getName = function() {
    return "Milkman Marauder";
  }

  static getCost = function() {
    return 7;
  }

  static getMoneyCost = function() {
    return 99;
  }

  static getRarity = function() {
    return Rarity.ULTRA_RARE;
  }

  static getImageIndex = function() {
    return 52;
  }

  static getText = function() {
    return "By day, a milk delivery man; by night, a master thief.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.HUMAN, Archetype.BOSS];
  }

}
