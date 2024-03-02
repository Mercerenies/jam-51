
function RoomGotoAction(roomTarget_) : Action() constructor {
  roomTarget = roomTarget_;

  static perform = function(continuation) {
    room_goto(roomTarget);
    // Do NOT invoke continuation; abort sequence
  }
}

function ArenaChoice() : ChooserChoice() constructor {

  static getLines = function() {
    return "The Arena\n\nPlay some cards!";
  }

  static getSprite = function() {
    // TODO This properly
    return spr_Ravenman;
  }

  static onChoose = function() {
    // Abstract method; must return an Action
    return new RoomGotoAction(rm_ChooseOpponent);
  }

}
