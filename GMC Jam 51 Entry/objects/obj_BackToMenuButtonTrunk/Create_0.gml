
// Inherit the parent event
event_inherited();

isDisabled = function() {
  var inDeck = array_length(global.playerDeck);
  var required = DECK_SIZE;
  return inDeck != required;
}
