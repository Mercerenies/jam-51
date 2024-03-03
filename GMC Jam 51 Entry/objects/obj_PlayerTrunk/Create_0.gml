
// Inherit the parent event
event_inherited();

text = "Your Trunk:";
cards = global.playerTrunk;

getActionButton = function(idx) {
  return new MoveToDeck(idx);
}