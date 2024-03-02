
function CardNinja(owner_) : MinionCard(owner_, 1, 2) constructor {

  static getId = function() {
    return 12;
  }

  static getName = function() {
    return "Hired Ninja";
  }

  static getCost = function() {
    return 2;
  }

  static getRarity = function() {
    return Rarity.COMMON;
  }

  static getImageIndex = function() {
    return 14;
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
