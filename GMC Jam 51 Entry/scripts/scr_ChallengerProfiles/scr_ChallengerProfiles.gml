
// Abstract base class
function ChallengerProfile() : ChooserChoice() constructor {
  timesBeaten = 0;
  timesLostTo = 0;
  uniqueConditionsMet = [];

  static getUniqueConditionsCount = function() {
    var total = 0;
    for (var i = 0; i < array_length(uniqueConditionsMet); i++) {
      total += uniqueConditionsMet[i];
    }
    return total;
  }

  static metAllConditions = function() {
    return getUniqueConditionsCount() >= array_length(getSecondaryConditions());
  }

  static getLines = function() {
    var winLossLine = "Wins " + string(timesBeaten) + " / Losses " + string(timesLostTo);
    var conditionsLine = "Goals " + string(getUniqueConditionsCount()) + " / " + string(array_length(getSecondaryConditions()));
    return getTitle() + "\n\n" + getSubtitle() + "\n\n" + winLossLine + "\n\n" + conditionsLine;
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

  static markConditions = function(bitmask) {
    // Takes a list of Booleans
    array_resize(uniqueConditionsMet, array_length(bitmask));
    for (var i = 0; i < array_length(bitmask); i++) {
      if (bitmask[i]) {
        uniqueConditionsMet[i] = 1;
      }
    }
  }

  static getUniqueCard = function() {
    // Abstract method
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
  _deck = [ // TODO
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
  ];
  _rewardsPool = [ // TODO
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

  static getUniqueCard = function() {
    // DEBUG CODE
    return CardAssassin;
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
    return [
      new QDebugCondition(CardFusion),
      new ZDebugCondition(CardNuclear),
    ];
  }

  // DEBUG CODE
  static onChoose = function() {
    return new GotoDialogueRoomAction(
      new DialogueCallback(
        new NullAction()
          .chain(setChars(spr_Ravengirl, spr_Ravenman))
          .chain(bottomDia("Ravenman's text", Mugshot.RAVENMAN))
          .chain(bottomDia("Ravengirl's text", Mugshot.RAVENGIRL_INTRO))
          .chain(new ChallengeOpponentAction(self)),
      ),
    )
    return new ChallengeOpponentAction(self);
  }
}

// Probably DEBUG CODE, this is his un-disguised variant.
function FlyingBrickmanChallenger() : ChallengerProfile() constructor {
  _deck = [ // TODO
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
  ]
  _rewardsPool = [ // TODO
    CardMushroom, CardSpikyMushroom,
  ];

  static getTitle = function() {
    return "Flying Brickman";
  }

  static getSubtitle = function() {
    return "The Man of Bricks";
  }

  static getUniqueCard = function() {
    // DEBUG CODE
    return CardAssassin;
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
