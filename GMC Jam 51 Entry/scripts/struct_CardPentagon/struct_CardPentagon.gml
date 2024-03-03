
function CardPentagon(owner_) : MinionCard(owner_, 2, 2) constructor {

  static getId = function() {
    return 4;
  }

  static getName = function() {
    return "Pentagon Protector";
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
    return 7;
  }

  static getText = function() {
    return "The Pentagon Protectors are a renowned league of sentries, respected by the top officials of the Icosaking's army.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.SHAPE];
  }

}
