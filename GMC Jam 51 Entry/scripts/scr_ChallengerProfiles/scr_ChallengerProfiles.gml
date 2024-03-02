
// Abstract base class
function ChallengerProfile() constructor {

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

}

function RavenmanChallenger() : ChallengerProfile() constructor {
  _deck = [
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
  ]

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
}

// Probably DEBUG CODE, this is his un-disguised variant.
function FlyingBrickmanChallenger() : ChallengerProfile() constructor {
  _deck = [
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
    CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
  ]

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
}


function initChallengers() {
  return [
    new RavenmanChallenger(),
    new FlyingBrickmanChallenger(),
  ]
}
