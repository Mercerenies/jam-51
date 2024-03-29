
// Abstract parent class. Do not instantiate directly.
//
// Concrete subclasses represent particular instances of cards on the
// field. Cards in the deck are stored as the Game Maker struct ID,
// which must be a 1-argument constructor function.
function Card(owner_) {
  owner = owner_;

  static getCardType = function() {
    var typeName = instanceof(self);
    return asset_get_index(typeName);
  }

  static getLimit = function() {
    if (isLimited()) {
      return 1;
    } else {
      return 3;
    }
  }

  static getId = function() {
    // Abstract method
  }

  static getName = function() {
    // Abstract method
  }

  static getCost = function() {
    // Abstract method
  }

  static getMoneyCost = function() {
    // Abstract method
  }

  static getRarity = function() {
    // Abstract method
  }

  static getImageIndex = function() { // Into getSprite
    // Abstract method
  }

  static isTextFlavor = function() {
    // Abstract method
  }

  static getTextIcon = function() {
    // Icon shown next to the text, as an Archetype constant. Default
    // is undefined, which shows no icon.
    return undefined;
  }

  static getText = function() {
    // Abstract method
  }

  static getSprite = function() {
    return spr_CardProfiles;
  }

  static isMinion = function() {
    // Abstract method
  }

  static isOngoing = function() {
    // Abstract method
  }

  static onPlayed = function() {
    // Returns an Action which shall run when the card is first
    // played.
    return new NullAction();
  }

  static onStandbyPhase = function() {
    // Returns an Action to run in the standby phase.
    return new NullAction();
  }

  static onEndPhase = function() {
    // Returns an Action to run in the end phase.
    return new NullAction();
  }

  static getEPModifier = function() {
    return 0;
  }

  static getDrawModifier = function() {
    // Modification to number of cards to draw.
    return 0;
  }

  static getHandModifier = function() {
    // Modification to hand limit.
    return 0;
  }

  static isLimited = function() {
    // An unlimited card (the default) can have 3 copies in your deck.
    // A limited card can only have one copy.
    return false;
  }

  static overlayText = function() {
    // For minion cards, this is the current level and morale. For
    // effects, this can be any state of the card, such as a turn
    // counter for timed cards.
    return undefined;
  }

  static isImmuneTo = function(owner_) {
    // True if this card is immune to effects played by the given
    // player.
    return false;
  }

  static grantsPassiveImmunity = function(owner_) {
    // True if this card grants immunity (from owner) to all cards on
    // the same side of the field.
    return false;
  }

  static drawCard = function(xx, yy) { // (xx, yy) is center
    // Card frame
    var cardImageIndex = rarityImageIndex(getRarity())
    draw_sprite(spr_CardFrame, cardImageIndex, xx, yy);
    // Card title
    draw_set_font(fnt_CardTitle);
    draw_set_color(c_black);
    draw_text(xx - 111, yy - 138, getName())
    // Card cost
    var costx = xx + 104;
    var costy = yy - 171;
    var cost = getCost();
    for (var i = 0; i < cost; i++) {
      draw_sprite(spr_CardIcons, EVIL_POINTS_ICON_INDEX, costx, costy);
      costx -= 30;
    }
    // Card profile
    draw_sprite(getSprite(), getImageIndex(), xx, yy - 12);
    // Card text icon
    var textx = xx - 134;
    var texty = yy + 49;
    var textw = 268;
    var texticon = getTextIcon();
    if (!is_undefined(texticon)) {
      draw_sprite(spr_CardIcons, archetypeImageIndex(texticon), textx + 14, texty + 14);
      textx += 30;
      textw -= 30;
    }
    // Card text
    draw_set_font(isTextFlavor() ? fnt_CardFlavorText : fnt_CardText);
    draw_text_ext(textx, texty, getText(), -1, textw);
    // Card rarity
    draw_sprite(spr_CardIcons, rarityTextImageIndex(getRarity()), xx - 118, yy + 163);
    // Card ID
    draw_set_valign(fa_bottom);
    draw_set_halign(fa_center);
    draw_set_font(fnt_CardIdText);
    draw_set_color(c_black);
    draw_text(xx, yy + CARD_HEIGHT / 2 - 8, "Unique ID: " + string(getId()));
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
  }

}
