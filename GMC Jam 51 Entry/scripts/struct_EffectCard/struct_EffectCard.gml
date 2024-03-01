
function EffectCard(owner_) : Card(owner_) constructor {

  static isMinion = function() {
    return false;
  }

  static isHero = function() {
    return false; // By default
  }

  static isTextFlavor = function() {
    return false;
  }

  static _super_drawCard = drawCard;

  static drawCard = function(xx, yy) {
    _super_drawCard(xx, yy);
    // Card Type
    var typeText = "(Effect)";
    if (isHero()) {
      typeText = "(Effect / Hero)";
    } else if (isOngoing()) {
      typeText = "(Effect / Ongoing)";
    }
    draw_set_font(fnt_CardStats);
    draw_set_valign(fa_middle);
    draw_text(xx - 128, yy - 82, typeText);
    draw_set_valign(fa_top);
  }

}
