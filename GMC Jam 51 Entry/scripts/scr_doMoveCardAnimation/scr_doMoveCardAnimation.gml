
function doMoveCardAnimation(source, target, card_, callback_) {
  var src_x = mean(source.bbox_left, source.bbox_right);
  var src_y = mean(source.bbox_top, source.bbox_bottom);
  var dest_x = mean(target.bbox_left, target.bbox_right);
  var dest_y = mean(target.bbox_top, target.bbox_bottom);
  with (instance_create_layer(src_x, src_y, "Instances_UI", obj_MoveCardAnimation)) {
    card = card_;
    target_x = dest_x;
    target_y = dest_y;
    callback = callback_;
  }

}
