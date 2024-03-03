
function TrunkSort_byName(a, b) {
  a = new a();
  b = new b();
  if (string_lower(a.getName()) < string_lower(b.getName())) {
    return -1;
  } else if (string_lower(a.getName()) > string_lower(b.getName())) {
    return 1;
  } else {
    return 0;
  }
}

function TrunkSort_byId(a, b) {
  a = new a();
  b = new b();
  if (a.getId() < b.getId()) {
    return -1;
  } else if (a.getId() > b.getId()) {
    return 1;
  } else {
    return 0;
  }
}

function TrunkSort_byRarity(a, b) {
  a = new a();
  b = new b();
  if (a.getRarity() < b.getRarity()) {
    return -1;
  } else if (a.getRarity() > b.getRarity()) {
    return 1;
  } else {
    return 0;
  }
}

function TrunkSort_byCost(a, b) {
  a = new a();
  b = new b();
  if (a.getCost() < b.getCost()) {
    return -1;
  } else if (a.getCost() > b.getCost()) {
    return 1;
  } else {
    return 0;
  }
}

function TrunkSort_byArchetypes(a, b) {
  a = archetypesValue(new a());
  b = archetypesValue(new b());
  if (a < b) {
    return -1;
  } else if (a > b) {
    return 1;
  } else {
    return 0;
  }
}

function archetypesValue(card) {
  // Converts archetypes to a number that we can compare.
  if (is_instanceof(card, EffectCard)) {
    if (card.isOngoing()) {
      return 10001;
    } else {
      return 10000;
    }
  }
  var total = 0;
  var archetypes = card.getArchetypes();
  for (var i = 0; i < array_length(archetypes); i++) {
    // Treat Archetype.HUMAN as insignificant since so many cards have
    // it. Treat Archetype.BOSS as insignificant because we want
    // bosses to be grouped with the cards they support.
    switch (archetypes[i]) {
    case Archetype.HUMAN:
      total += 1;
      break;
    case Archetype.NATURE:
      total += 4;
      break;
    case Archetype.TURTLE:
      total += 8;
      break;
    case Archetype.SHAPE:
      total += 16;
      break;
    case Archetype.PASTA:
      total += 32;
      break;
    case Archetype.CLOWN:
      total += 64;
      break;
    case Archetype.ROBOT:
      total += 128;
      break;
    case Archetype.BEE:
      total += 256;
      break;
    case Archetype.NINJA:
      total += 512;
      break;
    case Archetype.BOSS:
      total += 2;
      break;
    case Archetype.UNDEAD:
      total += 1024;
      break;
    }
  }
}
