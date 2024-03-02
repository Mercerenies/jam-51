
function ScrollChooserAction(delta_) : Action() constructor {
  delta = delta_;

  static perform = function(continuation) {
    with (par_ChooserIcon) {
      animating = true;
      animationStep = 0;
      animatingDirection = - other.delta;
      animationFinishedCallback = continuation;
    }
  }

}

function ChallengeOpponentAction(profile_) : Action() constructor {
  profile = profile_; // Should be a ChallengerProfile

  static perform = function(continuation) {
    // Does NOT execute the continuation, as we're breaking the flow
    // of the room here.
    CardGame_playGame(
      profile.buildPlayerProfile(),
      profile.buildFieldProfile(),
      profile.buildEnemyProfile(),
    );
  }

}

// Abstract base class
function ChooserChoice() constructor {

  static getLines = function() {
    // Abstract method
    return "";
  }

  static getSprite = function() {
    // Abstract method
  }

  static isLocked = function() {
    // Default is false, but overridable.
    return false;
  }

  static onChoose = function() {
    // Abstract method; must return an Action
    return new NullAction();
  }

}
