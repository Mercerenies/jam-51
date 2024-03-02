
enum Archetype {
  HUMAN, NATURE, TURTLE, SHAPE, PASTA, CLOWN, ROBOT, BEE, NINJA, BOSS, UNDEAD,
}

function archetypeName(archetype) {
  switch (archetype) {
  case Archetype.HUMAN:
    return "Human"
  case Archetype.NATURE:
    return "Nature"
  case Archetype.TURTLE:
    return "Turtle"
  case Archetype.SHAPE:
    return "Geometry"
  case Archetype.PASTA:
    return "Pasta"
  case Archetype.CLOWN:
    return "Clown"
  case Archetype.ROBOT:
    return "Robot"
  case Archetype.BEE:
    return "Bee"
  case Archetype.NINJA:
    return "Ninja"
  case Archetype.BOSS:
    return "Boss"
  case Archetype.UNDEAD:
    return "Undead"
  }
}

function archetypeImageIndex(archetype) {
  // Image index into spr_CardIcons
  switch (archetype) {
  case Archetype.HUMAN:
    return 1;
  case Archetype.NATURE:
    return 2;
  case Archetype.TURTLE:
    return 3;
  case Archetype.SHAPE:
    return 4;
  case Archetype.PASTA:
    return 5;
  case Archetype.CLOWN:
    return 6;
  case Archetype.ROBOT:
    return 7;
  case Archetype.BEE:
    return 8;
  case Archetype.NINJA:
    return 9;
  case Archetype.BOSS:
    return 11;
  case Archetype.UNDEAD:
    return 12;
  }
}
