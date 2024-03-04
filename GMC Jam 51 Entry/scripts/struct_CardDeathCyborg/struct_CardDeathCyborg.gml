
function CardDeathCyborg(owner_) : MinionCard(owner_, 3, 2) constructor {

  static getId = function() {
    return 46;
  }

  static getName = function() {
    return "Death Cyborg";
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
    return 60;
  }

  static getText = function() {
    return "After a near-death experience, he was augmented with metal parts. The lasers were his idea, though.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.ROBOT];
  }

}
