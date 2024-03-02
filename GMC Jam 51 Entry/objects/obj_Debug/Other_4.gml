
// DEBUG CODE (this whole object)
var deck = [CardNinja, CardAcorn, CardGoldenAcorn, CardCoverOfMoonlight, CardBee, CardZombie, CardAssassin, CardRhombus, CardPentagon, CardCircle, CardMirrorCrystal, CardNuclear, CardFusion, CardAncientScroll];
CardGame_playGame(
  new CharacterProfile(undefined, deck),
  new FieldProfile(30),
  new CharacterProfile(new EagerEnemyAI(), deck),
)
