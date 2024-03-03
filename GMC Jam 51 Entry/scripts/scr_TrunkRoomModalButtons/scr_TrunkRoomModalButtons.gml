
function MoveToTrunk(index_) : CardListModalButton() constructor {
  index = index_;

  static onClick = function() {
    var cardType = global.playerDeck[index];
    array_delete(global.playerDeck, index, 1);
    array_push(global.playerTrunk, cardType);
  }

  static buttonText = function() {
    return "Move to Trunk";
  }

  static isDisabled = function() {
    return false;
  }

}

function MoveToDeck(index_) : CardListModalButton() constructor {
  index = index_;

  static onClick = function() {
    var cardType = global.playerTrunk[index];
    array_delete(global.playerTrunk, index, 1);
    array_push(global.playerDeck, cardType);
  }

  static buttonText = function() {
    return "Move to Deck";
  }

  static isDisabled = function() {
    return false;
  }

}
