
// Abstract parent class. Do not instantiate directly.
//
// Concrete subclasses represent particular instances of cards on the
// field. Cards in the deck are stored as the Game Maker struct ID,
// which must be a 0-argument constructor function.
function Card() {

  static getName = function() {
    // Abstract method
  }

  static getCost = function() {
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

  static getText = function() {
    // Abstract method
  }

  static getSprite = function() {
    return spr_CardImage;
  }

  static isMinion = function() {
    // Abstract method
  }

  static isOngoing = function() {
    // Abstract method
  }

  static isLimited = function() {
    // An unlimited card (the default) can have 3 copies in your deck.
    // A limited card can only have one copy.
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
    // Card text
    draw_set_font(isTextFlavor() ? fnt_CardFlavorText : fnt_CardText);
    draw_text_ext(xx - 134, yy + 49, getText(), -1, 268);
    // Card rarity
    draw_sprite(spr_CardIcons, rarityTextImageIndex(getRarity()), xx - 118, yy + 163);
  }

}
