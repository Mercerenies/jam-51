
// I originally called this variable "alphaDelta" but decided
// that was a bit much.
var changeInAlpha = 0.1;

if (fadingIn) {
  image_alpha += changeInAlpha;
  if (image_alpha >= 1.0) {
    image_alpha = 1.0;
    fadingIn = false;
    callback.call();
  }
}

if (fadingOut) {
  image_alpha -= changeInAlpha;
  if (image_alpha <= 0.0) {
    image_alpha = 1.0;
    visible = false;
    fadingOut = false;
    callback.call();
  }
}