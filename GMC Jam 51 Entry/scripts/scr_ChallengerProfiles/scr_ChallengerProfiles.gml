
// Abstract base class
function ChallengerProfile() constructor {
  timesBeaten = 0;
  timesLostTo = 0;

  static markAsBeaten = function() {
    timesBeaten++;
  }

  static markAsLostTo = function() {
    timesLostTo++;
  }

  static getTitle = function() {
    // Abstract method
    return "";
  }

  static getSubtitle = function() {
    // Abstract method
    return "";
  }

  static getSprite = function() {
    // Abstract method
  }

  static getDeck = function() {
    // Abstract method
  }

  static isLocked = function() {
    return false; // TODO
  }

  static buildPlayerProfile = function() {
    return new CharacterProfile(undefined, global.playerDeck);
  }

  static buildFieldProfile = function() {
    return new FieldProfile(2, self); // (DEBUG CODE) DEFAULT_FORT_STRENGTH;
  }

  static buildEnemyProfile = function() {
    return new CharacterProfile(challengerAI(), getDeck());
  }

  static onChallenge = function() {
    return new ChallengeOpponentAction(self);
  }

  static challengerAI = function() {
    return new EagerEnemyAI();
  }

  static endgameRoom = function() {
    return rm_ChooseOpponent; // TODO
  }

  static rollMoneyReward = function() {
    // Amount of money gained if the player wins this fight.
    return 0;
  }

  static rollRegularReward = function() {
    // Card(s) given as a result of simply winning the fight.
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
    return [arrayRandom(_rewardsPool), arrayRandom(_rewardsPool)];
  }

  // DEBUG CODE
  static onChallenge = function() {
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
