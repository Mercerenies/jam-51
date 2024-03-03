
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
    .chain(challengeAction)
}
