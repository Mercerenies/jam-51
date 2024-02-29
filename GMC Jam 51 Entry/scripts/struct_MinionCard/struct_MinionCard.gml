
function MinionCard(level_, morale_) : Card() constructor {
  // These are the stats shown on the card. Do not modify these after
  // construction.
  base_level = level_;
  base_morale = morale_;

  // These are the current in-game stats and can be changed. Both must
  // always be >= 0. Outside callers should use the instance methods,
  // which have additional safety checks, to get and set these.
  _level = level_;
  _morale = morale_;

  static isMinion = function() {
    return true;
  }

  static isOngoing = function() {
    return true;
  }

  static getArchetypes = function() {
    // Abstract method, returns list of Archetypes.
  }

  static getLevel = function() {
    return _level;
  }

  static getMorale = function() {
    return _morale;
  }

  static _super_drawCard = drawCard;

  static drawCard = function(xx, yy) {
    _super_drawCard(xx, yy);
    // Archetypes
    var archex = xx - 112;
    var archey = yy - 82;
    var archetypes = getArchetypes();
    for (var i = 0; i < array_length(archetypes); i++) {
      draw_sprite(spr_CardIcons, archetypeImageIndex(archetypes[i]), archex, archey);
      archex += 30;
    }
    // Level / Morale
    draw_set_font(fnt_CardStats);
    draw_set_halign(fa_right);
    draw_set_valign(fa_middle);
    draw_text(xx + 118, yy + 163, "Lvl " + string(base_level) + " / " + string(base_morale) + " Mor");
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
  }

}
