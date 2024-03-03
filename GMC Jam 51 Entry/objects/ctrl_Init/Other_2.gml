
randomize();

global.cardSurface = undefined;
global.allChallengers = initChallengers();
global.shopPools = initShopPools();
global.shop = rollShop();

global.visitedLocation = false;
global.visitedArena = false;
global.visitedShop = false;
global.visitedTrunk = false;

global.isFirstPlay = false; // DEBUG CODE (should be true or loaded from file)

// DEBUG CODE (Set this to a real starter deck or load from file)
global.playerDeck = [
  CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
  CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
  CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
  CardMushroom, CardMushroom, CardMushroom, CardMushroom, CardMushroom,
];
global.playerTrunk = [];
global.playerMoney = 100; // DEBUG CODE 10;

// DEBUG CODE (Do a proper splash screen)
room_goto(rm_TitleScreen);
