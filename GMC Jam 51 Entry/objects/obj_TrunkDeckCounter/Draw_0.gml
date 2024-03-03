
draw_self();

draw_set_font(fnt_GeneralUI);

var inDeck = array_length(global.playerDeck);
var required = DECK_SIZE;

if (inDeck == required) {
  draw_set_color(c_black);
} else {
  draw_set_color(c_red);
}

var xx, yy;

xx = x + 32;
yy = y + sprite_height / 2;
draw_sprite(spr_CardIcons, CARDS_ICON_INDEX, xx, yy);
draw_text(xx + 16, yy - 12, string(inDeck) + " / " + string(required));
