
// Abstract parent for any object that retains an array of card
// instances of card types.

// List of card types or cards. Some subclasses may require one or the other.
cards = [];

appendCard = function(card) {
  cards[array_length(cards)] = card;
}

// Returns undefined if collection is empty.
popCard = function() {
  return array_pop(cards);
}

// Returns undefined if collection is empty.
topCard = function() {
  return array_last(cards);
}

cardCount = function() {
  return array_length(cards);
}

isEmpty = function() {
  return array_length(cards) <= 0;
}

clear = function() {
  array_resize(cards, 0);
}

replaceCards = function(newArray) {
  cards = arrayCopy(newArray);
}

getCard = function(idx) {
  return cards[idx];
}
