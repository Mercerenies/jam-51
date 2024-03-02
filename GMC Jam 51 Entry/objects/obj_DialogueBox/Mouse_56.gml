
if (display_text != text) {
  display_text = text;
} else {
  callback.call();
  instance_destroy();
}