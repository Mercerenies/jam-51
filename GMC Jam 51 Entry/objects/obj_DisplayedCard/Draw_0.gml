
var xscale = image_xscale;
var yscale = image_yscale;

if (overlaps(mouse_x, mouse_y)) {
  xscale *= 1.2;
  yscale *= 1.2;
}
drawCard(card, x, y, xscale, yscale, image_angle, image_blend, image_alpha);