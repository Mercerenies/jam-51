
function CardGame_playGame(playerProfile, fieldProfile, enemyProfile) {
  global.__CardGame_playerProfile = playerProfile;
  global.__CardGame_fieldProfile = fieldProfile;
  global.__CardGame_enemyProfile = enemyProfile;
  room_goto(rm_CardGame);
}
