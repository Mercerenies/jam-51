
function CardPotOfLinguine() : EffectCard() constructor {

  static getId = function() {
    return 2;
  }

  static getName = function() {
    return "Pot of Linguine";
  }

  static getCost = function() {
    return 1;
  }

  static getRarity = function() {
    return Rarity.UNCOMMON;
  }

  static getImageIndex = function() {
    return 0; // TODO
  }

  static getText = function() {
    return "Draw 2 cards. Limit 1 per deck.";
  }

  static isOngoing = function() {
    return false;
  }

  static isLimited = function() {
    return true;
  }

}
