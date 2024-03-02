
function gotoDialogueRoom(callback) {
  global.__DialogueRoom_callback = callback;
  room_goto(rm_Dialogue);
}
