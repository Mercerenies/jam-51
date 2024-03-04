
function CardFarmer(owner_) : MinionCard(owner_, 2, 2) constructor {

  static getId = function() {
    return 40;
  }

  static getName = function() {
    return "Farmer";
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
    return 42;
  }

  static getText = function() {
    return "Farmers are historically known for terrorizing moles. And occasionally baking them birthday cakes.";
  }

  static isTextFlavor = function() {
    return true;
  }

  static getArchetypes = function() {
    return [Archetype.HUMAN];
  }

}
