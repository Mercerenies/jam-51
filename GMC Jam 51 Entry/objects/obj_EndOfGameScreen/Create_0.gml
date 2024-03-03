
event_inherited();

playerWins = false;
moneySpoils = 0;
cardSpoils = [];

// Secondary conditions and which ones are met. These two arrays must
// have the same length.
conditions = [];
conditionsMask = [];

alpha = 0;

y += room_height;

isClickingActionButton = false;

overlapsButton = function(xx, yy) {
  var w = sprite_get_width(spr_BlueButton);
  var h = sprite_get_height(spr_BlueButton);
  return (abs(xx - buttonX()) <= w / 2) && (abs(yy - buttonY()) <= h / 2);
}

buttonIsDisabled = function() {
  return instance_exists(obj_CardListModal);
}

buttonX = function() {
  return bbox_right - 112;
}

buttonY = function() {
  return bbox_bottom - 64;
}

onButtonClick = function() {
  var field = global.__CardGame_fieldProfile;
  global.__CardGame_justWon = playerWins;
  field.challenger.onEndgame(playerWins)
}

cardX = function(idx) {
  return bbox_left + 64 + 86 * idx;
}

cardY = function(idx) {
  return y + 100;
}

overlappingCard = function(xx, yy) {
  if (instance_exists(obj_CardListModal)) {
    return undefined;
  }
  for (var i = 0; i < array_length(cardSpoils); i++) {
    var centerX = cardX(i);
    var centerY = cardY(i);
    if ((abs(centerX - xx) < CARD_WIDTH * 0.125) && (abs(centerY - yy) < CARD_HEIGHT * 0.125)) {
      return i;
    }
  }
  return undefined;
}
