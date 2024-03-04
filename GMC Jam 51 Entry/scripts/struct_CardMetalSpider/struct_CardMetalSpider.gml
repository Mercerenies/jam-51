
function CardMetalSpider(owner_) : MinionCard(owner_, 1, 2) constructor {

  static getId = function() {
    return 44;
  }

  static getName = function() {
    return "Metal Spider";
  }

  static getCost = function() {
    return 2;
  }

  static getMoneyCost = function() {
    return 4;
  }

  static getRarity = function() {
    return Rarity.COMMON;
  }

  static getImageIndex = function() {
    return 58;
  }

  static getText = function() {
    return "Spiders are a natural phobia of many civilians, so why not build an army of robotic ones?";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.ROBOT];
  }

}
