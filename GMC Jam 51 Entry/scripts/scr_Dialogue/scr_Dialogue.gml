
function DialogueAction(text_, xx_ = 276, yy_ = 560) : Action() constructor {
  text = text_;
  xx = xx_;
  yy = yy_;

  static perform = function(continuation) {
    with (instance_create_layer(xx, yy, "Instances_UI", obj_DialogueBox)) {
      text = other.text;
      callback = continuation;
    }
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
