if global.checkpoint == noone {
	game_restart();
} else {
	room_goto(global.checkpoint[0]);
	with(obj_player) {
		vida = vida_maxima
		x = global.checkpoint[1];
		y = global.checkpoint[2];
	}
}