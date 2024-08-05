
if interagir {
	if caractere < string_length(dialogo[# DialogoInfos.Dialogo, pagina]) {
		if audio_is_playing(sound_dialogo) {audio_stop_sound(sound_dialogo)}
		sound_dialogo = choose(
			snd_tecla1,snd_tecla2,snd_tecla3,snd_tecla4,snd_tecla5,snd_tecla6,snd_tecla7,snd_tecla8,snd_tecla9,
			snd_tecla10,snd_tecla11,snd_tecla12,snd_tecla13,snd_tecla14)
		audio_play_sound(sound_dialogo,1,false);
		caractere++;
		alarm[0] = delay_caractere;
	}
}