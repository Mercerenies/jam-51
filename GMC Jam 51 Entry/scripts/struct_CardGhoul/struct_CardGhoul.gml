
function CardGhoul(owner_) : MinionCard(owner_, 1, 2) constructor {

  static getId = function() {
    return 49;
  }

  static getName = function() {
    return "Ghoul";
  }

  static getCost = function() {
    return 3;
  }

  static getMoneyCost = function() {
    return 6;
  }

  static getRarity = function() {
    return Rarity.UNCOMMON;
  }

  static getImageIndex = function() {
    return 57;
  }

  static getText = function() {
    return "No one knows what lies underneath the sheet, but it's definitely dead... or is it?";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.UNDEAD];
  }

}
