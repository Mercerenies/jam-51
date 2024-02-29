
function CardGame_getDeck(owner_value) {
  with (obj_Deck) {
    if (owner == owner_value) {
      return self.id;
    }
  }
  throw "Could not find deck";
}

function CardGame_getDiscardPile(owner_value) {
  with (obj_DiscardPile) {
    if (owner == owner_value) {
      return self.id;
    }
  }
  throw "Could not find discard pile";
}

function CardGame_getHand(owner_value) {
  with (obj_PlayerHand) {
    if (owner == owner_value) {
      return self.id;
    }
  }
  throw "Could not find hand";
}

function CardGame_getMinionRow(owner_value) {
  with (obj_PlayerMinionRow) {
    if (owner == owner_value) {
      return self.id;
    }
  }
  throw "Could not find minion row";
}

function CardGame_getOngoingRow(owner_value) {
  with (obj_PlayerOngoingRow) {
    if (owner == owner_value) {
      return self.id;
    }
  }
  throw "Could not find ongoing row";
}
