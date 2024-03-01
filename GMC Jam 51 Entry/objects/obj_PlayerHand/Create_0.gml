
// Instance variable: owner (CardPlayer constant)

// Takes card types in the cards array.

event_inherited();

isHidden = function() {
  return owner != CardPlayer.LEFT;
}

actionButtonForCard = function(index) {
  if (isHidden()) {
    return undefined;
  }
  return new PlayCardModalButton(owner, index);
}
