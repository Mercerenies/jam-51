
enum CardPlayer {
  // The player character always sits on the left
  LEFT,
  // The enemy always sits on the right
  RIGHT,
}

function otherPlayer(player) {
  if (player == CardPlayer.LEFT) {
    return CardPlayer.RIGHT;
  } else {
    return CardPlayer.LEFT;
  }
}
