
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

  static onEndgame = function(playerWins) {
    // This function MUST move the game to a different room.
    room_goto(rm_ChooseLocation);
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
    CardMushroom, CardMushroom, CardMushroom, CardRobotMite, CardRobotMite,
    CardRobotMite, CardChicken, CardChicken, CardChicken, CardChicken,
    CardAcorn, CardAcorn, CardAcorn, CardBee, CardBee,
    CardBee, CardZombie, CardZombie, CardZombie, CardTinyTurtle,
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
  ];
  _rewardsPool = [
    CardMushroom, CardSpikyMushroom, CardAcorn,
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

  static onEndgame = function(playerWins) {
    if (playerWins) {
      gotoDialogueRoom(new DialogueCallback(Cutscene_ravenmanWin()));
    } else {
      gotoDialogueRoom(new DialogueCallback(Cutscene_ravenmanLoss()));
    }
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

  static buildFieldProfile = function() {
    return new RavenmanTutorialFieldProfile(fortStrength(), self);
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
    var challengeAction = new ChallengeOpponentAction(self);
    return challengeAction; // DEBUG CODE
    if (!shouldPlayTutorials()) {
      return challengeAction;
    }
    return new GotoDialogueRoomAction(new DialogueCallback(Cutscene_ravenmanIntro(challengeAction)))
  }
}

function initChallengers() {
  return [
    new RavenmanChallenger(),
  ]
}

function shouldPlayTutorials() {
  // TODO Implement this as a toggle button on the main menu screen
  // (if you've seen the given tutorial before)
  return true;
}
