
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
    //var conditionsLine = "Goals " + string(getUniqueConditionsCount()) + " / " + string(array_length(getSecondaryConditions()));
    return getTitle() + "\n\n" + getSubtitle() + "\n\n" + winLossLine; // + "\n\n" + conditionsLine;
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
    return false; // Didn't have time to do this
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
  ];
  _rewardsPool = [
    CardMushroom, CardSpikyMushroom, CardAcorn, CardBee, CardZombie,
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

  static onChoose = function() {
    var challengeAction = new ChallengeOpponentAction(self);
    if (!shouldPlayTutorials()) {
      return challengeAction;
    }
    return new GotoDialogueRoomAction(new DialogueCallback(Cutscene_ravenmanIntro(challengeAction)))
  }
}

function CountChallenger() : ChallengerProfile() constructor {
  _deck = [
    CardRavioli, CardRavioli, CardRavioli, CardMeatball, CardMeatball,
    CardMeatball, CardPotOfLinguine, CardPennePikeman, CardPenneSharpshooter, CardPennePikeman,
    CardPennePikeman, CardPenneSharpshooter, CardSpaghetti, CardFarmer, CardFarmer,
    CardPastaPower, CardSecondCourse, CardWithExtraCheese, CardPenneSharpshooter, CardPastaPower,
  ];
  _rewardsPool = [
    CardRavioli, CardMeatball, CardPotOfLinguine, CardFarmer, CardSpaghetti,
  ];

  static fortStrength = function() {
    return 30;
  }

  static getTitle = function() {
    return "Count Carbonara";
  }

  static getSubtitle = function() {
    return "The Count of Monte Crusto";
  }

  static onEndgame = function(playerWins) {
    if (playerWins) {
      gotoDialogueRoom(new DialogueCallback(Cutscene_countWin()));
    } else {
      gotoDialogueRoom(new DialogueCallback(Cutscene_countLoss()));
    }
  }

  static getSprite = function() {
    return spr_Count;
  }

  static getDeck = function() {
    return _deck;
  }

  static rollMoneyReward = function() {
    return 6;
  }

  static rollRegularReward = function() {
    return [arrayRandom(_rewardsPool)];
  }

  static onChoose = function() {
    var challengeAction = new ChallengeOpponentAction(self);
    if (!shouldPlayTutorials()) {
      return challengeAction;
    }
    return new GotoDialogueRoomAction(new DialogueCallback(Cutscene_countIntro(challengeAction)))
  }
}

function MinionmanChallenger() : ChallengerProfile() constructor {
  _deck = [
    CardRavioli, CardRavioli, CardRavioli, CardMeatball, CardMeatball,
    CardMeatball, CardMushroom, CardMushroom, CardMushroom, CardPennePikeman,
    CardSpikyMushroom, CardSpikyMushroom, CardSpikyMushroom, CardTinyTurtle, CardTinyTurtle,
    CardTinyTurtle, CardMaskedTurtle, CardBabyClown, CardMaskedTurtle, CardPig,
  ];
  _rewardsPool = [
    CardRavioli, CardMeatball, CardSpikyMushroom, CardTinyTurtle, CardBabyClown,
  ];

  static fortStrength = function() {
    return 30;
  }

  static getTitle = function() {
    return "Minionman";
  }

  static getSubtitle = function() {
    return "King of Minions";
  }

  static getSprite = function() {
    return spr_Minionman;
  }

  static getDeck = function() {
    return _deck;
  }

  static rollMoneyReward = function() {
    return 3;
  }

  static rollRegularReward = function() {
    return [arrayRandom(_rewardsPool)];
  }

  static onChoose = function() {
    var challengeAction = new ChallengeOpponentAction(self);
    return challengeAction;
  }
}

function IcosakingChallenger() : ChallengerProfile() constructor {
  _deck = [
    CardTriangle, CardTriangle, CardTriangle, CardSquare, CardSquare,
    CardSquare, CardRhombus, CardRhombus, CardRhombus, CardPentagon,
    CardPentagon, CardPentagon, CardCircle, CardCircle, CardCircle,
    CardMirrorCrystal, CardMirrorCrystal, CardNinja, CardAssassin, CardAssassin,
  ];
  _rewardsPool = [
    CardTriangle, CardRhombus, CardSquare, CardPentagon, CardCircle, CardMirrorCrystal,
  ];

  static fortStrength = function() {
    return 30;
  }

  static getTitle = function() {
    return "Icosaking";
  }

  static getSubtitle = function() {
    return "Usurper of Prismania";
  }

  static getSprite = function() {
    return spr_Icosaking;
  }

  static getDeck = function() {
    return _deck;
  }

  static rollMoneyReward = function() {
    return 7;
  }

  static rollRegularReward = function() {
    return [arrayRandom(_rewardsPool)];
  }

  static onChoose = function() {
    var challengeAction = new ChallengeOpponentAction(self);
    return challengeAction;
  }
}

function MaxwellChallenger() : ChallengerProfile() constructor {
  _deck = [
    CardIntern, CardIntern, CardIntern, CardMetalSpider, CardTempWorker,
    CardTempWorker, CardTempWorker, CardITWorker, CardITWorker, CardITWorker,
    CardContractor, CardContractor, CardContractor, CardMiddleManager, CardMiddleManager,
    CardInternet, CardSecondCourse, CardWithExtraCheese, CardMaskedTurtle, CardMetalSpider,
  ];
  _rewardsPool = [
    CardIntern, CardMetalSpider, CardTempWorker, CardITWorker, CardMiddleManager, CardContractor,
  ];

  static fortStrength = function() {
    return 30;
  }

  static getTitle = function() {
    return "Maxwell Sterling";
  }

  static getSubtitle = function() {
    return "Bullseye Cola Exec";
  }

  static getSprite = function() {
    return spr_Maxwell;
  }

  static getDeck = function() {
    return _deck;
  }

  static rollMoneyReward = function() {
    return 9;
  }

  static rollRegularReward = function() {
    return [arrayRandom(_rewardsPool)];
  }

  static onChoose = function() {
    var challengeAction = new ChallengeOpponentAction(self);
    return challengeAction;
  }
}

function initChallengers() {
  return [
    new RavenmanChallenger(),
    new MinionmanChallenger(),
    new CountChallenger(),
    new IcosakingChallenger(),
    new MaxwellChallenger(),
  ]
}

function shouldPlayTutorials() {
  // Implement this as a toggle button on the main menu screen (if
  // you've seen the given tutorial before) [didn't have time]
  return true;
}
