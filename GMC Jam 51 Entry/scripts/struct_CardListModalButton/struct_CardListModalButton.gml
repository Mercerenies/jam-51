
// Abstract base class
function CardListModalButton() constructor {

  static closesModalOnClick = function() {
    return true;
  }

  static onClick = function() {
    // Abstract method
  }

  static buttonText = function() {
    // Abstract method
  }

  static isDisabled = function() {
    return false;
  }

}
