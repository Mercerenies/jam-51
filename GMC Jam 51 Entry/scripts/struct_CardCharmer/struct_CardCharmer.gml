
function CardCharmer(owner_) : MinionCard(owner_, 2, 2) constructor {

  static getId = function() {
    return 48;
  }

  static getName = function() {
    return "Catacomb Charmer";
  }

  static getCost = function() {
    return 5;
  }

  static getMoneyCost = function() {
    return 99;
  }

  static getRarity = function() {
    return Rarity.ULTRA_RARE;
  }

  static getImageIndex = function() {
    return 56;
  }

  static getText = function() {
    return "She was so obsessed with skeletons that she decided to become one herself.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.UNDEAD, Archetype.BOSS];
  }

}
