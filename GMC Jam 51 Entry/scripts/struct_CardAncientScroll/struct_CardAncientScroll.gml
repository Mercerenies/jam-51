
function CardAncientScroll(owner_) : EffectCard(owner_) constructor {

  static getId = function() {
    return 14;
  }

  static getName = function() {
    return "Ancient Scroll";
  }

  static getCost = function() {
    return 2;
  }

  static getRarity = function() {
    return Rarity.COMMON;
  }

  static getImageIndex = function() {
    return 13;
  }

  static getTextIcon = function() {
    return Archetype.NINJA;
  }

  static getText = function() {
    return "Instant: +1 Level to all NINJA cards in play.";
  }

  static isOngoing = function() {
    return false;
  }

  static onPlayed = function() {
    // Returns an Action which shall run when the card is first
    // played.
    return new HighlightCardAction(self)
      .chain(new PowerUpArchetypesAction(owner, Archetype.NINJA));
  }

}
