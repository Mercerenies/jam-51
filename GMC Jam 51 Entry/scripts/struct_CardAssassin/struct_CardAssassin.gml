
function CardAssassin(owner_) : MinionCard(owner_, 1, 3) constructor {

  static getId = function() {
    return 13;
  }

  static getName = function() {
    return "Ninja Assassin";
  }

  static getCost = function() {
    return 3;
  }

  static getMoneyCost = function() {
    return 6;
  }

  static getRarity = function() {
    return Rarity.UNCOMMON;
  }

  static getImageIndex = function() {
    return 15;
  }

  static getText = function() {
    return "Immune to all enemy card effects.";
  }

  static isTextFlavor = function() {
    return false;
  }

  static getArchetypes = function() {
    return [Archetype.HUMAN, Archetype.NINJA];
  }

  static isImmuneTo = function(owner_) {
    return owner != owner_;
  }

}
