
function CardRobotAssistant(owner_) : MinionCard(owner_, 2, 2) constructor {

  static getId = function() {
    return 45;
  }

  static getName = function() {
    return "Robot Assistant";
  }

  static getCost = function() {
    return 4;
  }

  static getMoneyCost = function() {
    return 8;
  }

  static getRarity = function() {
    return Rarity.UNCOMMON;
  }

  static getImageIndex = function() {
    return 59;
  }

  static getText = function() {
    return "He can tell you the weather, make jokes, play your favorite playlists, and slaughter your enemies.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.ROBOT];
  }

}
