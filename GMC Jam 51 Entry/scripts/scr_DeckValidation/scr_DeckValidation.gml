
function validateDeckSize() {
  return array_length(global.playerDeck) == DECK_SIZE;
}

function validateDeckLimits() {
  var counts = _collectDeckCounts();
  var keys = variable_struct_get_names(counts);
  for (var i = 0; i < array_length(keys); i++) {
    var cardType = real(keys[i]);
    var count = counts[$ keys[i]];
    if (count > new cardType().getLimit()) {
      return false;
    }
  }
  return true;
}

function validateDeck() {
  return validateDeckSize() && validateDeckLimits();
}

function _collectDeckCounts() {
  var s = {};
  for (var i = 0; i < array_length(global.playerDeck); i++) {
    var c = string(real(global.playerDeck[i]));
    if (struct_exists(s, c)) {
      s[$ c]++;
    } else {
      s[$ c] = 1;
    }
  }
  return s;
}
