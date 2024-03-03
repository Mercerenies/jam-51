
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
  CardMushroom, CardMushroom, CardSpikyMushroom, CardRobotMite, CardRobotMite,
  CardRobotMite, CardChicken, CardChicken, CardChicken, CardChicken,
  CardAcorn, CardAcorn, CardSquare, CardRhombus, CardTriangle,
  CardTriangle, CardTinyTurtle, CardMaskedTurtle, CardMeatball, CardBee,
];
global.playerTrunk = [];
global.playerMoney = 10;

instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_Splash);
