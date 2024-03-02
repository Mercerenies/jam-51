
function drawButton(xx, yy, text, image_idx, sprite_idx = spr_BlueButton) {
  draw_sprite(sprite_idx, image_idx, xx, yy);
  draw_set_font(fnt_GeneralUI);
  draw_set_color((image_idx == 2) ? c_white : c_black);
  draw_set_halign(fa_center);
  draw_set_valign(fa_middle);
  draw_text(xx, yy, text);
  draw_set_halign(fa_left);
  draw_set_valign(fa_top);
}
