
event_inherited();

getCurrentChoice = function() {
  return global.allChallengers[currentIndex];
}

getMaxChoice = function() {
  return array_length(global.allChallengers) - 1;
}
