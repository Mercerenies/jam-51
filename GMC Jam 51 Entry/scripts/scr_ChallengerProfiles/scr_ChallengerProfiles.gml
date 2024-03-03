
// Abstract base class
function ChallengerProfile() : ChooserChoice() constructor {
  timesBeaten = 0;
  timesLostTo = 0;

  static getLines = function() {
    var winLossLine = "Wins " + string(timesBeaten) + " / Losses " + string(timesLostTo);
    return getTitle() + "\n\n" + getSubtitle() + "\n\n" + winLossLine;
  }

  static getTitle = function() {
    // Abstract method
    return "";
  }

  static getSubtitle = function() {
    // Abstract method
    return "";
  }

  static markAsBeaten = function() {
    timesBeaten++;
  }

  static markAsLostTo = function() {
    timesLostTo++;
  }

  static getDeck = function() {
    // Abstract method
  }

  static isLocked = function() {
    return false; // TODO
  }

  static fortStrength = function() {
    return DEFAULT_FORT_STRENGTH;
  }

  static buildPlayerProfile = function() {
    return new CharacterProfile(undefined, global.playerDeck);
  }

  static buildFieldProfile = function() {
    return new FieldProfile(fortStrength(), self);
  }

  static buildEnemyProfile = function() {
    return new CharacterProfile(challengerAI(), getDeck());
  }

  static onChoose = function() {
    return new ChallengeOpponentAction(self);
  }

  static challengerAI = function() {
    return new EagerEnemyAI();
  }

  static endgameRoom = function() {
    return rm_ChooseLocation; // TODO
  }

  static rollMoneyReward = function() {
    // Amount of money gained if the player wins this fight.
    return 0;
  }

  static rollRegularReward = function() {
    // Card(s) given as a result of simply winning the fight.
    return [];
  }

  static getSecondaryConditions = function() {
    // Array of SecondaryCondition objects.
    return [];
  }

}

function RavenmanChallenger() : ChallengerProfile() constructor {
  _deck = [
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
  ];
  _rewardsPool = [
    CardMushroom, CardSpikyMushroom,
  ];

  static fortStrength = function() {
    return 20;
  }

  static getTitle = function() {
    return "Ravenman";
  }

  static getSubtitle = function() {
    return "Ravenman's Lesson";
  }

  static getSprite = function() {
    return spr_Ravenman;
  }

  static getDeck = function() {
    return _deck;
  }

  static rollMoneyReward = function() {
    return 2;
  }

  static rollRegularReward = function() {
    return [arrayRandom(_rewardsPool)];
  }

  static getSecondaryConditions = function() {
    // DEBUG CODE
    return [new QDebugCondition(CardFusion)];
  }

  // DEBUG CODE
  static onChoose = function() {
    return new GotoDialogueRoomAction(
      new DialogueCallback(
        new NullAction()
          .chain(new DialogueAction("Test dialogue"))
          .chain(new DialogueAction("Test dialogue again"))
          .chain(new DialogueAction("Whee I have so much dialogue to share and I love it and this had better screenwrap :) smiley face"))
          .chain(new ChallengeOpponentAction(self)),
      ),
    )
    return new ChallengeOpponentAction(self);
  }
}

// Probably DEBUG CODE, this is his un-disguised variant.
function FlyingBrickmanChallenger() : ChallengerProfile() constructor {
  _deck = [
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
  ]
  _rewardsPool = [
    CardMushroom, CardSpikyMushroom,
  ];

  static getTitle = function() {
    return "Flying Brickman";
  }

  static getSubtitle = function() {
    return "The Man of Bricks";
  }

  static getSprite = function() {
    return spr_FlyingBrickman;
  }

  static getDeck = function() {
    return _deck;
  }

  static rollMoneyReward = function() {
    return 2;
  }

  static rollRegularReward = function() {
    return [arrayRandom(_rewardsPool)];
  }
}


function initChallengers() {
  return [
    new RavenmanChallenger(),
    new FlyingBrickmanChallenger(),
  ]
}
