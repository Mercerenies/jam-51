
var xscale = image_xscale;
var yscale = image_yscale;

if (position_meeting(mouse_x, mouse_y, self.id) && (!CardGame_showingModal())) {
  xscale *= 1.2;
  yscale *= 1.2;
}

if (array_length(cards) > 4) {
  draw_sprite_ext(sprite_index, 0, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
} else if (array_length(cards) > 0) {
  draw_sprite_ext(sprite_index, 1, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
} else {
  draw_sprite_ext(sprite_index, 2, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
}

var overlayText = string(array_length(cards)) + " / " + string(originalDeckSize);
var xx = mean(bbox_left, bbox_right);
var yy = lerp(bbox_top, bbox_bottom, 0.8);
draw_set_font(fnt_GeneralUI);
draw_set_color(COLOR_UI_GRAY);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var textwidth = string_width(overlayText);
var textheight = string_height(overlayText);
draw_rectangle(xx - textwidth / 2, yy - textheight / 2, xx + textwidth / 2, yy + textheight / 2, false);
draw_set_color(c_white);
draw_text(xx, yy, overlayText);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
