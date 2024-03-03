
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
    CardAcorn,
  ];
  var uncommonMinions = [
    CardAssassin, CardCircle, CardPentagon,
  ];
  var rareMinions = [
    CardGoldenAcorn,
  ];
  var commonEffects = [
    CardAncientScroll, CardMirrorCrystal,
  ];
  var uncommonEffects = [
    CardNuclear, CardSpareBattery, CardWithExtraCheese,
    CardPotOfLinguine,
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

function getShopGameState() {
  // TODO Determine this by number of unique wins so far
  //
  // 1 = early game
  // 2 = mid game
  // 3 = late game
  return 1;
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
