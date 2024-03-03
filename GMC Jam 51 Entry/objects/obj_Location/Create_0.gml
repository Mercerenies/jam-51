
event_inherited();

allChoices = [
  new ArenaChoice(),
  new ShopChoice(),
  new TrunkChoice(),
];

getCurrentChoice = function() {
  return allChoices[currentIndex];
}

getMaxChoice = function() {
  return array_length(allChoices) - 1;
}
