
var yy = y + 10 * sin(tick / 20);

var choice = getCurrentChoice();
draw_sprite_ext(choice.getSprite(), 0, x, yy, 0.5, 0.5, 0, c_white, 1);

var text = choice.getLines();

draw_set_color(c_black);
draw_set_font(fnt_GeneralTitle);

draw_set_halign(fa_center);
draw_text(x, y + 64, text);
draw_set_halign(fa_left);
