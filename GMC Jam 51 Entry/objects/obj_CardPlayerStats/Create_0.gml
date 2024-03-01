
// Has owner variable (one of CardPlayer constants)

evilPoints = 0;
fortDefense = 0;
maxFortDefense = 0;

// TODO Show this stat on screen as well
getHandLimit = function() {
  // TODO Calculate using card effects :)
  return DEFAULT_HAND_LIMIT;
}

// TODO Show this, if we decide to let cards augment it.
getCardsPerTurn = function() {
  return DEFAULT_CARDS_PER_TURN;
}

getEvilPointsPerTurn = function() {
  // TODO Augment with cards that are in play.
  return min(ctrl_CardGameManager.turnNumber + STARTING_EVIL_POINTS_PER_TURN, ENDING_EVIL_POINTS_PER_TURN);
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
