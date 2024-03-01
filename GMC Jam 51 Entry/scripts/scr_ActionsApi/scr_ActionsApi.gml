
// Functions for interfacing with the actions queue. These must only
// be called from a room where ctrl_CardGameManager exists.

function CardGame_hasAction() {
  return !is_undefined(ctrl_CardGameManager.currentAction);
}

function CardGame_enqueue(action) {
  if (is_array(action)) {
    for (var i = 0; i < array_length(action); i++) {
      CardGame_enqueue(action[i]);
    }
  } else {
    if (is_undefined(ctrl_CardGameManager.currentAction)) {
      ctrl_CardGameManager.currentAction = action;
      action.perform();
    } else {
      ds_queue_enqueue(ctrl_CardGameManager.actionsQueue, action);
    }
  }
}

function CardGame_finishAction() {
  ctrl_CardGameManager.currentAction = undefined;
  if (!ds_queue_empty(ctrl_CardGameManager.actionsQueue)) {
    var next = ds_queue_dequeue(ctrl_CardGameManager.actionsQueue);
    ctrl_CardGameManager.currentAction = next;
    next.perform();
  }
}
