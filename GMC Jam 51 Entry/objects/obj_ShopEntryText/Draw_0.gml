
if (is_undefined(entry)) {
  exit;
}

draw_set_color(c_black);
draw_set_font(fnt_GeneralUI);
draw_text(x, y, entry.getText());