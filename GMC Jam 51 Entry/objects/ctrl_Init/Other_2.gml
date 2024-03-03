
randomize();

global.cardSurface = undefined;
global.allChallengers = initChallengers();
global.shopPools = initShopPools();
global.allCards = initAllCards();
global.shop = rollShop();

global.visitedLocation = false;
global.visitedArena = false;
global.visitedShop = false;
global.visitedTrunk = false;

global.isFirstPlay = true;

global.playerDeck = [
  CardMushroom, CardMushroom, CardSpikyMushroom, CardRobotMite, CardRobotMite,
  CardSquare, CardRhombus, CardTinyTurtle, CardRavioli, CardChicken,
  CardAcorn, CardAcorn, CardSquare, CardRhombus, CardTriangle,
  CardTriangle, CardTinyTurtle, CardMaskedTurtle, CardMeatball, CardBee,
];
global.playerTrunk = [];
global.playerMoney = 10;

// Try to load a game, if the file exists.
loadGame();

instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_Splash);
