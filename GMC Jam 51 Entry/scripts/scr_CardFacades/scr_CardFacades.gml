
// Objects that have a drawCard compatible with the class Card but which are not themselves cards.

function DeckIcon() constructor {
  static drawCard = function(xx, yy) {
    var cardImageIndex = CARD_BACK_INDEX;
    draw_sprite(spr_CardFrame, cardImageIndex, xx, yy);
  }
}

function BlankIcon() constructor {
  static drawCard = function(xx, yy) {
    var cardImageIndex = CARD_BLANK_INDEX;
    draw_sprite(spr_CardFrame, cardImageIndex, xx, yy);
  }
}
