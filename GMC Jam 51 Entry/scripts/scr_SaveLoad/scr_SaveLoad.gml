
function encodeCard(cardType) {
  return script_get_name(cardType);
}

function decodeCard(str) {
  if (!struct_exists(global.allCards, str)) {
    return -1;
  }
  return asset_get_index(str);
}

function decodeCardArray(array) {
  var cards = array_map(array, decodeCard);
  // Filter out invalid ones
  return array_filter(cards, function(c) { return c >= 0; });
}

function _encodeChallengersArray() {
  return array_map(global.allChallengers, function(challenger) {
    return {
      timesBeaten: challenger.timesBeaten,
      timesLostTo: challenger.timesLostTo,
      uniqueConditionsMet: challenger.uniqueConditionsMet,
    }
  });
}

function _decodeChallengersArray(arr) {
  for (var i = 0; i < min(array_length(arr), array_length(global.allChallengers)); i++) {
    var data = arr[i];
    var challenger = global.allChallengers[i];
    challenger.timesBeaten = data.timesBeaten;
    challenger.timesLostTo = data.timesLostTo;
    challenger.uniqueConditionsMet = data.uniqueConditionsMet;
  }
}

function saveGame() {
  var saveData = {
    shop: array_map(global.shop, encodeCard),
    visitedLocation: global.visitedLocation,
    visitedArena: global.visitedArena,
    visitedShop: global.visitedShop,
    visitedTrunk: global.visitedTrunk,
    isFirstPlay: global.isFirstPlay,
    playerDeck: array_map(global.playerDeck, encodeCard),
    playerTrunk: array_map(global.playerTrunk, encodeCard),
    playerMoney: global.playerMoney,
    challengers: _encodeChallengersArray(),
  };
  json_save(GAME_FILENAME, saveData, false);
}

function loadGame() {
  if (!file_exists(GAME_FILENAME)) {
    return;
  }
  var json = json_load(GAME_FILENAME);
  if (is_undefined(json)) {
    return;
  }
  // Load data
  global.shop = decodeCardArray(json.shop);
  global.visitedLocation = json.visitedLocation;
  global.visitedArena = json.visitedArena;
  global.visitedShop = json.visitedShop;
  global.visitedTrunk = json.visitedTrunk;
  global.isFirstPlay = json.isFirstPlay;
  global.playerDeck = decodeCardArray(json.playerDeck);
  global.playerTrunk = decodeCardArray(json.playerTrunk);
  global.playerMoney = json.playerMoney;
  _decodeChallengersArray(json.challengers);
}
