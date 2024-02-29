
function CardGame_getDeck(owner_value) {
  with (obj_Deck) {
    if (owner == owner_value) {
      return self.id;
    }
  }
  throw "Could not find deck";
}
