
// Inherit the parent event
event_inherited();

// Variables pane: entry

text = "Buy";

// text and targetRoom variables in Variables

isDisabled = function() {
  return (global.playerMoney < entry.getMoneyCost());
}

onClick = function() {
  // TODO "Cha-ching" sound effect
  global.playerMoney -= entry.getMoneyCost();
  entry.onPurchase();
  saveGame(); // Prevent save-scumming on the "Random Card" option
}
