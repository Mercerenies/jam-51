
function CardSpikyTurtle(owner_) : MinionCard(owner_, 3, 2) constructor {

  static getId = function() {
    return 26;
  }

  static getName = function() {
    return "Spiky Turtle";
  }

  static getCost = function() {
    return 6;
  }

  static getMoneyCost = function() {
    return 12;
  }

  static getRarity = function() {
    return Rarity.UNCOMMON;
  }

  static getImageIndex = function() {
    return 27;
  }

  static getText = function() {
    return "They briefly considered breeding turtles with a spiky shell, but that was deemed too unrealistic. So instead, they just attached spikes onto all of his other body parts.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.TURTLE];
  }

}
