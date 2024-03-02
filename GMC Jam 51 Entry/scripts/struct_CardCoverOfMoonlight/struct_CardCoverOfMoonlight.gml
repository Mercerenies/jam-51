
function CardCoverOfMoonlight(owner_) : TimedOngoingCard(owner_, 2) constructor {

  static getId = function() {
    return 15;
  }

  static getName = function() {
    return "Cover of Moonlight";
  }

  static getCost = function() {
    return 2;
  }

  static getRarity = function() {
    return Rarity.RARE;
  }

  static getImageIndex = function() {
    return 16;
  }

  static getText = function() {
    return "Ongoing: Enemy cards cannot affect your Minions, lasts 2 turns.";
  }

  static isOngoing = function() {
    return true;
  }

  static grantsPassiveImmunity = function(owner_) {
    return owner_ != owner;
  }

}
