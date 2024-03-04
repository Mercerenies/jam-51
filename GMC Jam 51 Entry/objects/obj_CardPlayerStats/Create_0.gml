
// Has owner variable (one of CardPlayer constants)

evilPoints = 0;
fortDefense = 0;
maxFortDefense = 0;

getHandLimit = function() {
  return DEFAULT_HAND_LIMIT + CardGame_querySum(owner, function(card) { return card.getHandModifier(); });
}

getCardsPerTurn = function() {
  return DEFAULT_CARDS_PER_TURN + CardGame_querySum(owner, function(card) { return card.getDrawModifier(); });
}

getEvilPointsPerTurn = function() {
  var basePoints = min(ctrl_CardGameManager.turnNumber + STARTING_EVIL_POINTS_PER_TURN, ENDING_EVIL_POINTS_PER_TURN);
  return basePoints + CardGame_querySum(owner, function(card) { return card.getEPModifier(); });
}

evilPointsX = function() {
  return x + 12;
}

evilPointsY = function() {
  return y + 14;
}

fortDefenseX = function() {
  return x + 12;
}

fortDefenseY = function() {
  return y + 46;
}

handLimitX = function() {
  return x + sprite_width / 2 + 30;
}

handLimitY = function() {
  return y + 14;
}
