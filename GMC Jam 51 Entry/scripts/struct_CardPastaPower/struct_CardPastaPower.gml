
function CardPastaPower(owner_) : EffectCard(owner_) constructor {

  static getId = function() {
    return 50;
  }

  static getName = function() {
    return "Pasta Power!";
  }

  static getCost = function() {
    return 2;
  }

  static getMoneyCost = function() {
    return 4;
  }

  static getRarity = function() {
    return Rarity.COMMON;
  }

  static getImageIndex = function() {
    return 63;
  }

  static getTextIcon = function() {
    return Archetype.PASTA;
  }

  static getText = function() {
    return "Instant: +1 Level to all PASTA Minions in play.";
  }

  static isOngoing = function() {
    return false;
  }

  static onPlayed = function() {
    // Returns an Action which shall run when the card is first
    // played.
    return new HighlightCardAction(self)
      .chain(new PowerUpArchetypesAction(owner, Archetype.PASTA));
  }

}
