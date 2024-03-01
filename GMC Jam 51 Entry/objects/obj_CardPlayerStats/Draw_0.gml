
draw_set_font(fnt_GeneralUI);
draw_set_color(c_black);

var xx, yy;

// Evil Points
xx = x + 14;
yy = y + 14;
draw_sprite(spr_CardIcons, EVIL_POINTS_ICON_INDEX, xx, yy);
draw_text(xx + 16, yy - 14, string(evilPoints));

// Fort Defense
yy += 32;
draw_sprite(spr_CardIcons, FORT_ICON_INDEX, xx, yy);
draw_text(xx + 16, yy - 14, string(fortDefense));
