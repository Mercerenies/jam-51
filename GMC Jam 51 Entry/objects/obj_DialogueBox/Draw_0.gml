
draw_self();
draw_set_font(fnt_DialogueBox);
draw_set_color(c_black);
draw_text_ext(x, y, display_text, -1, 480);

if (mugshotIndex >= 0) {
  draw_sprite(spr_Mugshots, mugshotIndex, mean(bbox_left, x), mean(bbox_top, bbox_bottom));
}
