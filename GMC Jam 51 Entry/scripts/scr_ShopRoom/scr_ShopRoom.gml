
// Categories not specifically marked as "minion" may contain minions
// or effect cards. Those ending in _MINION will always contain a
// minion.
function initShopPools() {
  // All cards that can appear in the shop, organized by their rarity
  // class.
  var commonMinions = [
    CardBee, CardMushroom, CardNinja,
    CardRhombus, CardRobotMite, CardSpikyMushroom,
    CardSquare, CardTriangle, CardZombie,
    CardAcorn, CardTinyTurtle, CardRavioli,
    CardMeatball, CardChicken, CardIntern,
    CardTempWorker, CardITWorker, CardPennePikeman,
    CardPig, CardGiantPig, CardBabyClown, CardToddlerClown,
    CardMetalSpider,
  ];
  var uncommonMinions = [
    CardAssassin, CardCircle, CardPentagon,
    CardMaskedTurtle, CardContractor, CardMiddleManager,
    CardPennePikeman, CardSpaghetti, CardFarmer,
    CardUndeadPig, CardGhoul, CardRobotAssistant, CardDeathCyborg,
  ];
  var rareMinions = [
    CardGoldenAcorn, CardSpikyTurtle,
    // Ultra rares
    CardMilkman, CardCharmer,
  ];
  var commonEffects = [
    CardAncientScroll, CardMirrorCrystal, CardPastaPower,
    CardInternet,
  ];
  var uncommonEffects = [
    CardNuclear, CardSpareBattery, CardWithExtraCheese,
    CardPotOfLinguine, CardSecondCourse,
  ];
  var rareEffects = [
    CardCoverOfMoonlight, CardFusion, CardMilkDelivery,
  ];
  return {
    commonMinions: commonMinions,
    uncommonMinions: uncommonMinions,
    commonAny: array_concat(commonMinions, commonEffects),
    uncommonAny: array_concat(uncommonMinions, uncommonEffects),
    rareAny: array_concat(rareMinions, rareEffects),
  }
}

function initAllCards() {
  var s = {};
  s[$ script_get_name(CardMushroom)] = 1;
  s[$ script_get_name(CardPotOfLinguine)] = 2;
  s[$ script_get_name(CardSpikyMushroom)] = 3;
  s[$ script_get_name(CardPentagon)] = 4;
  s[$ script_get_name(CardRhombus)] = 5;
  s[$ script_get_name(CardCircle)] = 6;
  s[$ script_get_name(CardSquare)] = 7;
  s[$ script_get_name(CardTriangle)] = 8;
  s[$ script_get_name(CardMirrorCrystal)] = 9;
  s[$ script_get_name(CardNuclear)] = 10;
  s[$ script_get_name(CardFusion)] = 11;
  s[$ script_get_name(CardNinja)] = 12;
  s[$ script_get_name(CardAssassin)] = 13;
  s[$ script_get_name(CardAncientScroll)] = 14;
  s[$ script_get_name(CardCoverOfMoonlight)] = 15;
  s[$ script_get_name(CardZombie)] = 16;
  s[$ script_get_name(CardBee)] = 17;
  s[$ script_get_name(CardAcorn)] = 18;
  s[$ script_get_name(CardGoldenAcorn)] = 19;
  s[$ script_get_name(CardRobotMite)] = 20;
  s[$ script_get_name(CardSpareBattery)] = 21;
  s[$ script_get_name(CardMilkDelivery)] = 22;
  s[$ script_get_name(CardWithExtraCheese)] = 23;
  s[$ script_get_name(CardTinyTurtle)] = 24;
  s[$ script_get_name(CardMaskedTurtle)] = 25;
  s[$ script_get_name(CardSpikyTurtle)] = 26;
  s[$ script_get_name(CardRavioli)] = 27;
  s[$ script_get_name(CardMeatball)] = 28;
  s[$ script_get_name(CardChicken)] = 29;
  s[$ script_get_name(CardIntern)] = 30;
  s[$ script_get_name(CardTempWorker)] = 31;
  s[$ script_get_name(CardITWorker)] = 32;
  s[$ script_get_name(CardContractor)] = 33;
  s[$ script_get_name(CardMiddleManager)] = 34;
  s[$ script_get_name(CardPennePikeman)] = 35;
  s[$ script_get_name(CardPenneSharpshooter)] = 36;
  s[$ script_get_name(CardSpaghetti)] = 37;
  s[$ script_get_name(CardPig)] = 38;
  s[$ script_get_name(CardGiantPig)] = 39;
  s[$ script_get_name(CardFarmer)] = 40;
  s[$ script_get_name(CardUndeadPig)] = 41;
  s[$ script_get_name(CardBabyClown)] = 42;
  s[$ script_get_name(CardToddlerClown)] = 43;
  s[$ script_get_name(CardMetalSpider)] = 44;
  s[$ script_get_name(CardRobotAssistant)] = 45;
  s[$ script_get_name(CardDeathCyborg)] = 46;
  s[$ script_get_name(CardMilkman)] = 47;
  s[$ script_get_name(CardCharmer)] = 48;
  s[$ script_get_name(CardGhoul)] = 49;
  s[$ script_get_name(CardPastaPower)] = 50;
  s[$ script_get_name(CardInternet)] = 51;
  s[$ script_get_name(CardSecondCourse)] = 52;
  return s;
}

function getShopGameState() {
  // 1 = early game
  // 2 = mid game
  // 3 = late game
  return 3; // Didn't have time to implement this for real, so lock it at the highest setting.
}

// Note: global.shop only includes regular cards, not the "Lootbox" and "Restock" options.
function rollShop() {
  var shop = [];
  switch (getShopGameState()) {
  case 1:
    array_push(shop, arrayRandom(global.shopPools.commonMinions));
    array_push(shop, arrayRandom(global.shopPools.commonMinions));
    array_push(shop, arrayRandom(global.shopPools.commonMinions));
    array_push(shop, arrayRandom(global.shopPools.commonAny));
    array_push(shop, arrayRandom(global.shopPools.commonAny));
    array_push(shop, arrayRandom(global.shopPools.commonAny));
    break;
  case 2:
    array_push(shop, arrayRandom(global.shopPools.commonMinions));
    array_push(shop, arrayRandom(global.shopPools.commonMinions));
    array_push(shop, arrayRandom(global.shopPools.commonAny));
    array_push(shop, arrayRandom(global.shopPools.commonAny));
    array_push(shop, arrayRandom(global.shopPools.uncommonAny));
    array_push(shop, arrayRandom(global.shopPools.uncommonAny));
    break;
  case 3:
    array_push(shop, arrayRandom(global.shopPools.commonMinions));
    array_push(shop, arrayRandom(global.shopPools.commonAny));
    array_push(shop, arrayRandom(global.shopPools.commonAny));
    array_push(shop, arrayRandom(global.shopPools.uncommonAny));
    array_push(shop, arrayRandom(global.shopPools.uncommonAny));
    array_push(shop, arrayRandom(global.shopPools.rareAny));
    break;
  }
  array_shuffle_ext(shop);
  return shop;
}

function spawnShopEntry(xx, yy, entry) {
  instance_create_layer(xx, yy, "Instances", obj_DisplayedCard, {
    card: entry.getCard(),
    image_xscale: 0.2,
    image_yscale: 0.2,
  });
  instance_create_layer(xx + 146, yy, "Instances", obj_BuyButton, { entry });
  instance_create_layer(xx + 252, yy - 16, "Instances", obj_ShopEntryText, { entry });
}
