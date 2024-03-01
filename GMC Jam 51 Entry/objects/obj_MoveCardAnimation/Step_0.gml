
if (point_distance(x, y, target_x, target_y) < movement_speed) {
  x = target_x;
  y = target_y;
  callback.call();
  instance_destroy();
} else {
  var dir = point_direction(x, y, target_x, target_y);
  x += lengthdir_x(movement_speed, dir);
  y += lengthdir_y(movement_speed, dir);
}
