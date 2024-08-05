if global.pause == true {
	image_speed = 0;
	exit;
}

image_speed = 1;

alarme--;

if alarme <= 0 {
	alarme = irandom_range(100, 260);
	state = inimigo_escolher_estado;
}

script_execute(state);