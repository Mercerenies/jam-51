
// This class is concrete but extensible. The only reason you should
// need to subclass it is to implement injection points for tutorials
// and things. Most field profiles will be direct instances of this
// class, not a subclass.
function FieldProfile(defense_, challenger_) constructor {
  defense = defense_;
  challenger = challenger_;

  // Field profiles have several injection points where they can act
  // to explain mechanics and things. By default, the FieldProfile
  // struct implements all of these with NullAction, but subclasses
  // may provide nontrivial implementations.

  static afterDrawPhase = function(turnPlayer) {
    return new NullAction();
  }

  static afterStandbyPhase = function(turnPlayer) {
    return new NullAction();
  }

  // Called when the player tries to end her turn. If this returns
  // non-undefined, then the "End Turn" action is cancelled and this
  // runs instead. Only works for the player's turn. The AI's End Turn
  // action cannot be interrupted.
  static playerEndTurnInterrupt = function() {
    return undefined;
  }

}

function RavenmanTutorialFieldProfile(defense_, challenger_) : FieldProfile(defense_, challenger_) constructor {

  static afterDrawPhase = function(turnPlayer) {
    return new RavenmanTutorialDrawAction(turnPlayer);
  }

  static afterStandbyPhase = function(turnPlayer) {
    return new RavenmanTutorialStandbyAction(turnPlayer);
  }

  static playerEndTurnInterrupt = function() {
    var turnNumber = ctrl_CardGameManager.turnNumber;
    if (turnNumber == 0) {
      // Player must have played at least one card.
      var minionRow = CardGame_getMinionRow(CardPlayer.LEFT);
      if (minionRow.cardCount() == 0) {
        return new NullAction()
          .chain(bottomDia("Please play some cards before you end your turn."));
      }
    }
    return undefined;
  }

}

function RavenmanTutorialStandbyAction(turnPlayer_) : Action() constructor {
  turnPlayer = turnPlayer_;

  static perform = function(continuation) {
    var turnNumber = ctrl_CardGameManager.turnNumber;
    var action = new NullAction();
    if (turnPlayer == CardPlayer.LEFT) {
      if (turnNumber == 0) {
        // First introduction text.
        action = new NullAction()
          .chain(bottomDia("Welcome to Evil Cards.", Mugshot.NONE))
          .chain(bottomDia("The goal of the game is to destroy your opponent's fort before they destroy yours.", Mugshot.NONE))
          .chain(bottomDia("Each turn, you draw 3 cards. Then you play as many cards as you want.", Mugshot.NONE))
          .chain(topDia("In the lower-left corner, the red star icon is your Evil Points, or EP for short. You get two EP on your first turn.", Mugshot.NONE))
          .chain(topDia("Below that is your fort's defense. If that hits zero, you lose.", Mugshot.NONE))
          .chain(topDia("Then there's your hand limit. You can only hold five cards in your hand.", Mugshot.NONE))
          .chain(topDia("You spend Evil Points to play cards. Each card indicates its Evil Point cost by the number of stars at the top.", Mugshot.NONE))
          .chain(bottomDia("You have two Evil Points, so play some cards and then hit the \"End Turn\" button.", Mugshot.NONE))
          .chain(bottomDia("To play a card, click on it, and then click the \"Play\" button.", Mugshot.NONE));
      } else if (turnNumber == 1) {
        // Continuation text.
        action = new NullAction()
          .chain(topDia("Keep wearing down your enemy's fort defense."))
          .chain(topDia("If your deck ever runs out, your discard is reshuffled automatically, so don't worry about running out of cards."));
      }
    } else {
      if (turnNumber == 0) {
        // Enemy introduction text.
        action = new NullAction()
          .chain(bottomDia("Now your opponent has a chance to do the same.", Mugshot.NONE))
      }
    }
    action.perform(continuation);
  }

}

function RavenmanTutorialDrawAction(turnPlayer_) : Action() constructor {
  turnPlayer = turnPlayer_;

  static perform = function(continuation) {
    var turnNumber = ctrl_CardGameManager.turnNumber;
    var action = new NullAction();
    if (turnPlayer == CardPlayer.LEFT) {
      if (turnNumber == 1) {
        // First introduction text.
        action = new NullAction()
          .chain(topDia("This turn, you get 3 EP instead of 2.", Mugshot.NONE))
          .chain(topDia("Next turn, you'll get 4, then 5, and so on, up to a maximum of 8 EP per turn.", Mugshot.NONE))
          .chain(topDia("Any Evil Points not spent are lost at the end of a turn.", Mugshot.NONE))
          .chain(topDia("Now that you have Minion cards in play, at the beginning of your turn, all of your Minions will attack.", Mugshot.NONE))
          .chain(topDia("Every Minion has two stats: Level and Morale.", Mugshot.NONE))
          .chain(topDia("Each of your Minions deals damage to the enemy fort equal to their Level. Then each Minion loses 1 Morale.", Mugshot.NONE))
          .chain(topDia("When their Morale hits zero, they go to the discard pile.", Mugshot.NONE))
      }
    } else {
      if (turnNumber == 1) {
        // Enemy introduction text.
        action = new NullAction()
          .chain(bottomDia("Now your opponent's Minions attack.", Mugshot.NONE))
      }
    }
    action.perform(continuation);
  }

}
