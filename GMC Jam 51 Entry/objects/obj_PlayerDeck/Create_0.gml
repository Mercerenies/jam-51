
// Inherit the parent event
event_inherited();

text = "Your Deck:";
cards = global.playerDeck;

getActionButton = function(idx) {
  return new MoveToTrunk(idx);
}