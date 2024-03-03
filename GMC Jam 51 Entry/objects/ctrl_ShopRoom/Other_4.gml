
// Instantiate shop entries
var shopEntries = [];

// Add regular cards
for (var i = 0; i < array_length(global.shop); i++) {
  array_push(shopEntries, new CardShopEntry(global.shop[i]));
}

// Special entries
array_push(shopEntries, new LootShopEntry());
array_push(shopEntries, new RestockShopEntry());

var xx = 64;
var yy = 64;
for (var i = 0; i < array_length(shopEntries); i++) {
  spawnShopEntry(xx, yy, shopEntries[i]);
  yy += 90;
}
