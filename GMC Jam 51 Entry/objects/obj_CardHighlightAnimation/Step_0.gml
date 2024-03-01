image_xscale += 0.005;
image_yscale += 0.005;

if (image_xscale > 0.375) {
  callback.call();
  instance_destroy();
}