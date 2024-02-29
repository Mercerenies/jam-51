
enum Rarity {
  COMMON, UNCOMMON, RARE, ULTRA_RARE,
}

function rarityImageIndex(rarity) {
  // Image index into spr_CardFrame
  switch (rarity) {
  case Rarity.COMMON:
    return 0;
  case Rarity.UNCOMMON:
    return 1;
  case Rarity.RARE:
    return 2;
  case Rarity.ULTRA_RARE:
    return 3;
  }
}

function rarityTextImageIndex(rarity) {
  // Image index into spr_CardIcons
  switch (rarity) {
  case Rarity.COMMON:
    return 13;
  case Rarity.UNCOMMON:
    return 14;
  case Rarity.RARE:
    return 15;
  case Rarity.ULTRA_RARE:
    return 16;
  }
}