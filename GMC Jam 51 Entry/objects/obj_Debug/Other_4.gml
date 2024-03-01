
// DEBUG CODE (this whole object)
var deck = [CardMushroom, CardSpikyMushroom, CardPotOfLinguine, CardTriangle, CardSquare, CardRhombus, CardPentagon, CardCircle, CardMirrorCrystal, CardNuclear, CardFusion];
CardGame_playGame(
  new CharacterProfile(undefined, deck),
  new FieldProfile(30),
  new CharacterProfile(new EagerEnemyAI(), deck),
)
