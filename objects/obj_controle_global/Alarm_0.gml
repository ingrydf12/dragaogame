switch room {
	case rm_inicio_cidade:
		if !audio_is_playing(snd_trem) {
			audio_play_sound(snd_trem,3,false,.08);
		}
		alarm[0] = irandom_range(180, 360);
		break;
	case rm_inicio_porto:
		if !audio_is_playing(snd_trem) {
			audio_play_sound(snd_trem,3,false,.06);
		}
		alarm[0] = irandom_range(380, 600);
		break;
	case rm_final_porto:
		if !audio_is_playing(snd_trem) {
			audio_play_sound(snd_trem,3,false,.05);
		}
		if !audio_is_playing(snd_sininhos) {
			audio_play_sound(snd_sininhos,4,false,.08);
		}
		alarm[0] = irandom_range(600, 720);
		break;
}