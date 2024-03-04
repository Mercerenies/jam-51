
// Helpers for miscellaneous cutscenes for challengers and story
// purposes.

function Cutscene_firstVisitChooseLocation() {
  return new NullAction()
    .chain(bottomDia("This is the main menu. Here, you can visit three locations."))
    .chain(bottomDia("In the ARENA, you can face off against different supervillains."))
    .chain(bottomDia("The SHOP sells various cards, and its stock changes every time you play a game of Evil Cards."))
    .chain(bottomDia("Your TRUNK allows you to customize your deck with the new cards you've won or bought."));
}

function Cutscene_firstVisitArena() {
  return new NullAction()
    .chain(bottomDia("This is the ARENA. Here, you can face off against various supervillains."))
    .chain(bottomDia("You can face the same villain as many times as you like."))
    .chain(bottomDia("Note that later villains must be unlocked by beating the earlier ones."));
}

function Cutscene_firstVisitShop() {
  return new NullAction()
    .chain(bottomDia("This is the SHOP. You can spend your hard-earned money here on new cards."))
    .chain(bottomDia("The shop's inventory changes after every game you play. But you can also pay to RESTOCK it yourself."))
    .chain(bottomDia("The RANDOM CARD option will give you a random card. You can get any card in the game this way, except ULTRA RARE cards."))
    .chain(bottomDia("New cards go in your TRUNK, not your DECK. You'll need to visit the \"Trunk\" on the main menu to add them to your deck."));
}

function Cutscene_firstVisitTrunk() {
  return new NullAction()
    .chain(bottomDia("This is your TRUNK. Here, you can modify your current deck."))
    .chain(bottomDia("Click on a card to see details, and right click it to move it between the trunk or deck."))
    .chain(bottomDia("Your deck must consist of exactly twenty cards. And you can have at most three copies of any given card in your deck."))
    .chain(bottomDia("Some cards are further limited and can only be included once in your deck."));
}

function Cutscene_ravenmanIntro(challengeAction) {
  return new NullAction()
    .chain(setChars(spr_Ravengirl, spr_Ravenman))
    .chain(bottomDia("Thank you for coming on short notice, Ravengirl.", Mugshot.RAVENMAN))
    .chain(bottomDia("Your text was pretty vague. What's going on, Ravenman?", Mugshot.RAVENGIRL_INTRO))
    .chain(bottomDia("Take a look at this pamphlet.", Mugshot.RAVENMAN))
    .chain(bottomDia("\"International Clock Polishers' Association meeting today\"? Is this a joke?", Mugshot.RAVENGIRL_INTRO))
    .chain(bottomDia("I never joke, Ravengirl. Look at the guest list.", Mugshot.RAVENMAN))
    .chain(bottomDia("Bristlegaze? Venomatrix? Count Carbonara? These are all villains you've faced before.", Mugshot.RAVENGIRL_INTRO))
    .chain(bottomDia("A bunch of supervillains are meeting today under the guise of the International Clock Polishers' Association.", Mugshot.RAVENMAN))
    .chain(bottomDia("This is where you come in. I need you to infiltrate their meeting and figure out what they're really planning.", Mugshot.RAVENMAN))
    .chain(bottomDia("You're not coming?", Mugshot.RAVENGIRL_INTRO))
    .chain(bottomDia("I'm afraid I can't. They'd smell me coming a mile away.", Mugshot.RAVENMAN))
    .chain(bottomDia("I was going to ask...", Mugshot.RAVENGIRL_INTRO))
    .chain(bottomDia("I had a run-in with Skunk Man yesterday. I don't want to talk about it.", Mugshot.RAVENMAN))
    .chain(bottomDia("Normally I would send Ravenboy with you. But his grandmother took ill suddenly yesterday, so it's up to you.", Mugshot.RAVENMAN))
    .chain(bottomDia("The false Clock Polishers' Association is meeting at the Imperial Grandeur Hotel across town. You'll pose as the hotel's cleaning staff and earn their trust.", Mugshot.RAVENMAN))
    .chain(bottomDia("Your disguise is in the back room.", Mugshot.RAVENMAN))
    .chain(fadeOutLeft())
    .chain(delayDia(60))
    .chain(bottomDia("Oh, you have got to be kidding me.", Mugshot.RAVENGIRL_INTRO))
    .chain(delayDia(60))
    .chain(fadeInLeft(spr_RavengirlMaid))
    .chain(delayDia(30))
    .chain(bottomDia("It's an upscale hotel. They have a dress code.", Mugshot.RAVENMAN))
    .chain(bottomDia("You owe me big time after this.", Mugshot.RAVENGIRL))
    .chain(bottomDia("Now, if my information is correct, supervillains love playing Evil Cards.", Mugshot.RAVENMAN))
    .chain(bottomDia("\"Evil Cards\"?", Mugshot.RAVENGIRL))
    .chain(bottomDia("It's... a card game they invented to pass the time.", Mugshot.RAVENMAN))
    .chain(bottomDia("If you're going to infiltrate their ranks, you'll need to learn how to play.", Mugshot.RAVENMAN))
    .chain(bottomDia("Let me show you.", Mugshot.RAVENMAN))
    .chain(challengeAction)
}

function Cutscene_ravenmanWin() {
  return new NullAction()
    .chain(setChars(spr_RavengirlMaid, spr_Ravenman))
    .chain(bottomDia("Good work, Ravengirl!", Mugshot.RAVENMAN))
    .chain(bottomDia("When you win a game of Evil Cards, you'll get some money and at least one new card!", Mugshot.RAVENMAN))
    .chain(bottomDia("Every player also has some unique objectives. If you meet those objectives and win, you'll get a rarer card.", Mugshot.RAVENMAN))
    .chain(bottomDia("And if you meet all of the objectives, you'll get an exclusive ULTRA RARE card.", Mugshot.RAVENMAN))
    .chain(Cutscene_ravenmanEnd());
}

function Cutscene_ravenmanLoss() {
  return new NullAction()
    .chain(setChars(spr_RavengirlMaid, spr_Ravenman))
    .chain(bottomDia("Hmm... perhaps you need a bit more practice, Ravengirl.", Mugshot.RAVENMAN))
    .chain(bottomDia("If you win a game of Evil Cards, you get some money and at least one new card!", Mugshot.RAVENMAN))
    .chain(bottomDia("Every player also has some unique objectives. If you meet those objectives and win, you'll get a rarer card.", Mugshot.RAVENMAN))
    .chain(bottomDia("And if you meet all of the objectives, you'll get an exclusive ULTRA RARE card.", Mugshot.RAVENMAN))
    .chain(Cutscene_ravenmanEnd());
}

function Cutscene_ravenmanEnd() {
  return new NullAction()
    .chain(setChars(spr_RavengirlMaid, spr_Ravenman))
    .chain(bottomDia("Anyway, I recommend heading to the Shop next. You can buy some better cards before you face any real opponents."))
    .chain(new GotoRoomAction());
}

function Cutscene_countIntro(challengeAction) {
  return new NullAction()
    .chain(setChars(spr_RavengirlMaid, spr_Count))
    .chain(bottomDia("Stand in deference, girl! You are in the presence of the one and only Count Carbonara!", Mugshot.COUNT))
    .chain(bottomDia("I would be happy to play cards against you, but you'll fall before my various pasta-themed machinations.", Mugshot.COUNT))
    .chain(challengeAction)
}

function Cutscene_countLoss() {
  return new NullAction()
    .chain(setChars(spr_RavengirlMaid, spr_Count))
    .chain(bottomDia("Better luck next time! Perhaps you should study up on your pasta!", Mugshot.COUNT))
    .chain(new GotoRoomAction());
}

function Cutscene_countWin() {
  return new NullAction()
    .chain(setChars(spr_RavengirlMaid, spr_Count))
    .chain(bottomDia("Whaaaat?! You beat me? But you're not even wearing a big purple hat!", Mugshot.COUNT))
    .chain(new GotoRoomAction());
}
