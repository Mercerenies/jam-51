
randomize();

global.cardSurface = undefined;
global.allChallengers = initChallengers();

global.isFirstPlay = true;

// DEBUG CODE (Set this to a real starter deck or load from file)
global.playerDeck = [
  CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
  CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
  CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
  CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
];
global.playerTrunk = [];
global.playerMoney = 10;

// DEBUG CODE (Do a proper splash screen)
room_goto(rm_TitleScreen);
