
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

function doTextAnimation(xx, yy, text_, color_ = undefined, time = 60) {

  if (is_real(text_)) {
    if (text_ > 0) {
      text_ = "+" + string(text_);
    } else {
      text_ = string(text_);
    }
  }

  if (is_undefined(color_)) {
    // Default color is optimized for numerical strings like "+X" or "-X".
    if (string_starts_with(text_, "-")) {
      color_ = c_red;
    } else {
      color_ = $004000;
    }
  }

  with (instance_create_layer(xx, yy, "Instances_UI", obj_TextAnimation)) {
    color = color_;
    text = text_;
    alarm[0] = time;
  }
}
