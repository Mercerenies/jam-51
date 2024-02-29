
enum Archetype {
  HUMAN, FUNGUS, TURTLE, SHAPE, PASTA, CLOWN, ROBOT, BEE, NINJA, BOSS, UNDEAD,
}

function archetypeName(archetype) {
  switch (archetype) {
  case Archetype.HUMAN:
    return "Human"
  case Archetype.FUNGUS:
    return "Fungus"
  case Archetype.TURTLE:
    return "Turtle"
  case Archetype.SHAPE:
    return "Shape"
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
  // TODO
}
