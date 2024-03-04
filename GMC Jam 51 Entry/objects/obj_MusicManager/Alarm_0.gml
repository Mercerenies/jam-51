
if (audio_is_playing(snd_BattleIntro)) {
  alarm[0] = 1;
} else {
  audio_play_sound(snd_Battle, 0, true);
}