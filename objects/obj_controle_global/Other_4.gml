if !instance_exists(obj_player) {
	if room != rm_menu and room != rm_cutscene_porto_final {
		instance_create_layer(1152,1344,"Player",obj_player);
	}
}

switch room {
	default:
		audio_stop_all();
		if !audio_is_playing(snd_menu_background) {
			audio_play_sound(snd_menu_background,6,true,.12);
		}
		break;
	case rm_inicio_cidade:
		audio_stop_all();
		if !audio_is_playing(snd_cidade_background) {
			audio_play_sound(snd_cidade_background,10,true,.05);
		}
		if !audio_is_playing(snd_sininhos) {
			audio_play_sound(snd_sininhos,4,true,.3,5);
		}
		//if !audio_is_playing(snd_city_ambience) {
		//	audio_play_sound(snd_city_ambience,5,true);
		//}
		alarm[0] = 40;
		break;
	case rm_inicio_porto:
		audio_stop_all();
		if !audio_is_playing(snd_porto_background) {
			audio_play_sound(snd_porto_background,10,true,.12);
		}
		alarm[0] = 40;
		break;
	case rm_final_porto:
		audio_stop_all();
		if !audio_is_playing(snd_porto_ambience) {
			audio_play_sound(snd_porto_ambience,9,true,.08);
		}
		if !audio_is_playing(snd_porto_background) {
			audio_play_sound(snd_porto_background,10,true,.12);
		}
		alarm[0] = 40;
		break;
	case rm_cutscene_porto_final:
		audio_stop_all();
		if !audio_is_playing(snd_final_scene) {
			audio_play_sound(snd_final_scene,10,true,.12);
		}
		break;
}