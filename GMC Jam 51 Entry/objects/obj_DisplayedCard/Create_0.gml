
// Variables Pane: card

overlaps = function(xx, yy) {  
  var w = image_xscale * CARD_WIDTH;
  var h = image_yscale * CARD_HEIGHT;
  return (abs(x - xx) < w / 2) && (abs(y - yy) < h / 2);
}