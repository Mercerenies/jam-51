
// Abstract base class
function ShopEntry() constructor {

  static getName = function() {
    // Abstract method
    return "";
  }

  static getCard = function() {
    // Abstract method
    return new DeckIcon();
  }

  static getMoneyCost = function() {
    // Abstract method
    return 999;
  }

  static getText = function() {
    return getName() + " ($" + string(getMoneyCost()) + ")";
  }
}

function CardShopEntry(cardType_) : ShopEntry() constructor {
  cardType = cardType_;
  card = new cardType_(); // Only allocate the temporary once, to avoid frivolous allocations

  static getName = function() {
    return card.getName();
  }

  static getCard = function() {
    return card;
  }

  static getMoneyCost = function() {
    return card.getMoneyCost();
  }
}

function LootShopEntry() : ShopEntry() constructor {
  static getName = function() {
    return "Random Card";
  }

  static getCard = function() {
    return new DeckIcon();
  }

  static getMoneyCost = function() {
    return RANDOM_SHOP_COST;
  }
}

// TODO Auto-Restock all shop entries after X games.
function RestockShopEntry() : ShopEntry() constructor {
  static getName = function() {
    return "Restock";
  }

  static getCard = function() {
    return new BlankIcon();
  }

  static getMoneyCost = function() {
    return RESTOCK_SHOP_COST;
  }
}
