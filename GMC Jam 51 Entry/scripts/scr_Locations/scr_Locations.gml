
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
    return spr_ArenaLocation;
  }

  static onChoose = function() {
    return new RoomGotoAction(rm_ChooseOpponent);
  }

}

function ShopChoice() : ChooserChoice() constructor {

  static getLines = function() {
    return "The Shop\n\nBuy some new cards!";
  }

  static getSprite = function() {
    return spr_ShopLocation;
  }

  static onChoose = function() {
    return new RoomGotoAction(rm_Shop);
  }

}

function TrunkChoice() : ChooserChoice() constructor {

  static getLines = function() {
    return "Your Trunk\n\nBuild your deck!";
  }

  static getSprite = function() {
    return spr_TrunkLocation;
  }

  static onChoose = function() {
    return new RoomGotoAction(rm_Trunk);
  }

}
