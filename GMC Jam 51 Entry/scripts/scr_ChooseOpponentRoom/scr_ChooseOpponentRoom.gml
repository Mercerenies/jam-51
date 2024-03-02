
function ScrollChallengerAction(delta_) : Action() constructor {
  delta = delta_;

  static perform = function(continuation) {
    with (obj_Challenger) {
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
