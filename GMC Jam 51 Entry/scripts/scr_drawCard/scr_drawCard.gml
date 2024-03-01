
// Accepts either a script index for card or a literal card object.
function drawCard(card, xx, yy, xscale, yscale, rot, col, alpha) {
  // Draw card at full size to surface
  if (is_undefined(global.cardSurface) || !surface_exists(global.cardSurface)) {
    global.cardSurface = surface_create(CARD_WIDTH, CARD_HEIGHT);
  }

  if (!is_struct(card)) {
    card = new card(CardPlayer.LEFT); // Instantiate temporary with default owner
  }

  surface_set_target(global.cardSurface);
  draw_clear_alpha(c_black, 0);
  card.drawCard(CARD_WIDTH / 2, CARD_HEIGHT / 2);
  surface_reset_target();

  var distancex = - xscale * CARD_WIDTH / 2;
  var distancey = - yscale * CARD_HEIGHT / 2;
  var xcorner = xx + distancex * dcos(rot) - distancey * dsin(rot);
  var ycorner = yy + distancex * dsin(rot) + distancey * dcos(rot);
  draw_surface_ext(global.cardSurface, xcorner, ycorner, xscale, yscale, rot, col, alpha);
}
