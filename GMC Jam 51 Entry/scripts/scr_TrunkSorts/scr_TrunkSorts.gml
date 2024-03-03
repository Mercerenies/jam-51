
function TrunkSort_byName(a, b) {
  a = new a();
  b = new b();
  if (string_lower(a.getName()) < string_lower(b.getName())) {
    return -1;
  } else if (string_lower(a.getName()) > string_lower(b.getName())) {
    return 1;
  } else {
    return 0;
  }
}