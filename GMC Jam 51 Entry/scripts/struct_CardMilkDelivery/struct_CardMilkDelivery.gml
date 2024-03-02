
function CardMilkDelivery(owner_) : EffectCard(owner_) constructor {

  static getId = function() {
    return 22;
  }

  static getName = function() {
    return "Milk Delivery";
  }

  static getCost = function() {
    return 4;
  }

  static getRarity = function() {
    return Rarity.RARE;
  }

  static getImageIndex = function() {
    return 23;
  }

  static getText = function() {
    return "Instant: +1 Morale to all of your Minions.";
  }

  static isOngoing = function() {
    return false;
  }

  static onPlayed = function() {
    // Returns an Action which shall run when the card is first
    // played.
    return new HighlightCardAction(self)
      .chain(new MilkDelvieryAction(owner));
  }

}

function MilkDelvieryAction(owner_) : Action() constructor {
  owner = owner_;

  static perform = function(continuation) {
    var myMinions = arrayCopy(CardGame_getMinionRow(owner).cards);
    for (var i = 0; i < array_length(myMinions); i++) {
      var card = myMinions[i];
      card.modifyMorale(1);
      doTextAnimation(getCardX(card), getCardY(card), 1);
    }
    continuation.call();
  }
}
