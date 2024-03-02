
event_inherited();

playerWins = false;

alpha = 0;

y += room_height;

isClickingActionButton = false;

overlapsButton = function(xx, yy) {
  var w = sprite_get_width(spr_BlueButton);
  var h = sprite_get_height(spr_BlueButton);
  return (abs(xx - buttonX()) <= w / 2) && (abs(yy - buttonY()) <= h / 2);
}

buttonIsDisabled = function() {
  return false;
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
  room_goto(field.challenger.endgameRoom());
}