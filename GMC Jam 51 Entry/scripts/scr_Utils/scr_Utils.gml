
function arrayCopy(arr) {
  var newArr = [];
  array_copy(newArr, 0, arr, 0, array_length(arr));
  return newArr;
}

function NullCallable() constructor {
  static call = function() {
    // Intentionally left blank.
  }
}
