
function CardMirrorCrystal(owner_) : EffectCard(owner_) constructor {

  static getId = function() {
    return 9;
  }

  static getName = function() {
    return "Mirror Crystal";
  }

  static getCost = function() {
    return 2;
  }

  static getRarity = function() {
    return Rarity.COMMON;
  }

  static getImageIndex = function() {
    return 10;
  }

  static getTextIcon = function() {
    return Archetype.SHAPE;
  }

  static getText = function() {
    return "Instant: +1 Level to all GEOMETRY cards in play.";
  }

  static isOngoing = function() {
    return false;
  }

  static onPlayed = function() {
    // Returns an Action which shall run when the card is first
    // played.
    return new HighlightCardAction(self)
      .chain(new PowerUpArchetypesAction(owner, Archetype.SHAPE));
  }

}
