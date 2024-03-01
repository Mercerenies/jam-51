
function PlayCardModalButton(owner_, cardIndex_) : CardListModalButton() constructor {
  owner = owner_;
  cardIndex = cardIndex_;

  static getCard = function() {
    var hand = CardGame_getHand(owner);
    return hand.getCard(cardIndex);
  }

  static onClick = function() {
    CardGame_runAction(CardGame_Action_playCard(owner, cardIndex));
  }

  static buttonText = function() {
    if (isDisabled()) {
      return "(Can't afford)";
    } else {
      return "Play";
    }
  }


  static isDisabled = function() {
    var cardType = getCard();
    var cost = new cardType().getCost();
    return cost > CardGame_getStats(owner).evilPoints;
  }

}
