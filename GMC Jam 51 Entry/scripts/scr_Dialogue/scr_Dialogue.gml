
function DialogueAction(text_, mugshotIndex_, xx_ = 242, yy_ = 560) : Action() constructor {
  text = text_;
  mugshotIndex = mugshotIndex_;
  xx = xx_;
  yy = yy_;

  static perform = function(continuation) {
    with (instance_create_layer(xx, yy, "Instances_UI", obj_DialogueBox)) {
      text = other.text;
      mugshotIndex = other.mugshotIndex;
      callback = continuation;
    }
  }
}

function SetDialogueCharsAction(left_, right_) : Action() constructor {
  left = left_;
  right = right_;

  static perform = function(continuation) {
    with (obj_DialogueCharacter) {
      if (x < room_width / 2) {
        _setDiaChar(self.id, other.left);
      } else {
        _setDiaChar(self.id, other.right);
      }
    }
    continuation.call();
  }
}

function FadeInCharAction(objSupplier_, newSprite_) : Action() constructor {
  objSupplier = objSupplier_;
  newSprite = newSprite_;

  static perform = function(continuation) {
    var obj = objSupplier();
    obj.fadingIn = true;
    obj.image_alpha = 0;
    obj.visible = true;
    obj.sprite_index = newSprite;
    obj.callback = continuation;
  }
}

function FadeOutCharAction(objSupplier_) : Action() constructor {
  objSupplier = objSupplier_;

  static perform = function(continuation) {
    var obj = objSupplier();
    obj.fadingOut = true;
    obj.image_alpha = 1;
    obj.visible = true;
    obj.callback = continuation;
  }
}

function _leftChar() {
  with (obj_DialogueCharacter) {
    if (x < room_width / 2) {
      return id;
    }
  }
}

function _rightChar() {
  with (obj_DialogueCharacter) {
    if (x >= room_width / 2) {
      return id;
    }
  }
}

function _setDiaChar(obj, sprite) {
  if (is_undefined(sprite)) {
    obj.visible = false;
  } else {
    obj.sprite_index = sprite;
    obj.visible = true;
  }
}

function GotoRoomAction(room_ = rm_ChooseLocation) : Action() constructor {
  roomTarget = room_;

  static perform = function(continuation) {
    // Do NOT invoke continuation; this is an interrupt.
    room_goto(roomTarget);
  }
}

function GotoDialogueRoomAction(dialogueCallback_) : Action() constructor {
  // Can be any callable object, but will usually be a
  // DialogueCallback.
  dialogueCallback = dialogueCallback_;

  static perform = function(continuation) {
    // Do NOT invoke continuation; this is an interrupt.
    gotoDialogueRoom(dialogueCallback);
  }
}

function DialogueCallback(action_) constructor {
  action = action_;

  static call = function() {
    CardGame_runAction(action)
  }
}

// Helpers: All of these return Actions.

function bottomDia(text, mugshotIndex) {
  return new DialogueAction(text, mugshotIndex); // Default dialogue position
}

function topDia(text, mugshotIndex) {
  return new DialogueAction(text, mugshotIndex, 242, 75);
}

function setChars(left, right) {
  return new SetDialogueCharsAction(left, right);
}

function fadeInLeft(sprite) {
  return new FadeInCharAction(_leftChar, sprite);
}

function fadeInRight(sprite) {
  return new FadeInCharAction(_rightChar, sprite);
}

function fadeOutLeft() {
  return new FadeOutCharAction(_leftChar);
}

function fadeOutRight() {
  return new FadeOutCharAction(_rightChar);
}

function delayDia(time = 60) {
  return new DelayAction(time);
}
