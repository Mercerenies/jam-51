
function EffectCard() : Card() constructor {

  static isMinion = function() {
    return false;
  }

  static isHero = function() {
    return false; // By default
  }

  static isTextFlavor = function() {
    return false;
  }

}
