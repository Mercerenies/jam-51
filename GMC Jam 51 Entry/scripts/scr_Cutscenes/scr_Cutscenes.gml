
// Helpers for miscellaneous cutscenes for challengers and story
// purposes.

function Cutscene_ravenmanIntro(challengeAction) {
  return new NullAction()
    .chain(setChars(spr_Ravengirl, spr_Ravenman))
    .chain(bottomDia("Thank you for coming on short notice, Ravengirl.", Mugshot.RAVENMAN))
    .chain(bottomDia("Your text was pretty vague. What's going on, Ravenman?", Mugshot.RAVENGIRL_INTRO))
    .chain(bottomDia("Take a look at this pamphlet.", Mugshot.RAVENMAN))
    .chain(bottomDia("\"International Clock Polishers' Association meeting today\"? Is this a joke?", Mugshot.RAVENGIRL_INTRO))
    .chain(bottomDia("I never joke, Ravengirl. Look at the guest list.", Mugshot.RAVENMAN))
    .chain(bottomDia("Infernoshell? Venomatrix? Count Carbonara? These are all villains you've faced before.", Mugshot.RAVENGIRL_INTRO))
    .chain(bottomDia("They're all villains that I locked up.", Mugshot.RAVENMAN))
    .chain(bottomDia("All of my biggest adversaries are meeting today under the guise of the International Clock Polishers' Association.", Mugshot.RAVENMAN))
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
