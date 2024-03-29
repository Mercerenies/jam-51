
function CardPotOfLinguine(owner_) : EffectCard(owner_) constructor {

  static getId = function() {
    return 2;
  }

  static getName = function() {
    return "Pot of Linguine";
  }

  static getCost = function() {
    return 1;
  }

  static getMoneyCost = function() {
    return 10;
  }

  static getRarity = function() {
    return Rarity.UNCOMMON;
  }

  static getImageIndex = function() {
    return 2;
  }

  static getText = function() {
    return "Instant: Draw 2 cards. Limit 1 per deck.";
  }

  static isOngoing = function() {
    return false;
  }

  static isLimited = function() {
    return true;
  }

  static onPlayed = function() {
    // Returns an Action which shall run when the card is first
    // played.
    return new HighlightCardAction(self).chain(CardGame_Action_drawCards(owner, 2));
  }

}
