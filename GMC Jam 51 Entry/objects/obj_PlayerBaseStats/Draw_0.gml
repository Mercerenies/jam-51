
draw_self();

draw_set_font(fnt_GeneralUI);
draw_set_color(c_black);

var xx, yy;

// Money
xx = x + 32;
yy = y + sprite_height / 2;
draw_sprite(spr_CardIcons, DOLLARS_ICON_INDEX, xx, yy);
draw_text(xx + 16, yy - 12, "$" + string(global.playerMoney));
