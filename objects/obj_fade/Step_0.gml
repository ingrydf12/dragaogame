
if transicao {
	alpha-=.01;
} else {
	alpha+=.01;
}

if alpha >= 1 {
	room_goto(destino);
	
	with (obj_player) {
		x = other.xdest;
		y = other.ydest;
		dir_spr = 0;
		detectar_sprite(Sprites.Idle,sprites_player);
		
		hspd = 0;
		vspd += gravidade;
		colisao();
	}
}

if transicao and alpha <= 0 {
	instance_destroy();
}