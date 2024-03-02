
var yy = y + 10 * sin(tick / 20);

var challenger = getChallenger();
draw_sprite_ext(challenger.getSprite(), 0, x, yy, 0.5, 0.5, 0, c_white, 1);

var text = challenger.getTitle();
text += "\n\n" + challenger.getSubtitle();
text += "\n\nWins " + string(challenger.timesBeaten) + " / Losses " + string(challenger.timesLostTo);

draw_set_color(c_black);
draw_set_font(fnt_GeneralTitle);

draw_set_halign(fa_center);
draw_text(x, y + 64, text);
draw_set_halign(fa_left);
