
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

function _setDiaChar(obj, sprite) {
  if (is_undefined(sprite)) {
    obj.visible = false;
  } else {
    obj.sprite_index = sprite;
    obj.visible = true;
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

function topDia(text) {
  return new DialogueAction(text, mugshotIndex, 242, 75);
}

function setChars(left, right) {
  return new SetDialogueCharsAction(left, right);
}
