
event_inherited();

allChoices = [
  new ArenaChoice(),
];

getCurrentChoice = function() {
  return allChoices[currentIndex];
}

getMaxChoice = function() {
  return array_length(allChoices) - 1;
}
