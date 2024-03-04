
alarm[0] = -1;

var desiredTrack = snd_Overworld;
if (room == rm_CardGame) {
  desiredTrack = snd_Battle;
}

if (!audio_is_playing(desiredTrack)) {
  audio_stop_all();
  if (desiredTrack == snd_Overworld) {
    audio_play_sound(snd_Overworld, 0, true);
  } else {
    audio_play_sound(snd_BattleIntro, 0, false);
    alarm[0] = 1;
  }
}