
// DEBUG CODE (this whole object)
var deck = [CardMushroom, CardMushroom, CardMushroom, CardSpikyMushroom, CardPotOfLinguine, CardTriangle, CardTriangle, CardTriangle, CardSquare, CardRhombus, CardPentagon, CardCircle];
CardGame_playGame(
  new CharacterProfile(undefined, deck),
  new FieldProfile(10),
  new CharacterProfile(new EagerEnemyAI(), deck),
)
