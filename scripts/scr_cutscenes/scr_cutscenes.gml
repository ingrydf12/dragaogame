function cutscene_action_end() {
	action++;
	
	if action >= array_length(cutscene) {
		global.cutscene = false;
		instance_destroy();
	}
}

function cutscene_action_fade(dest,xx,yy) {
	var fade = instance_create_layer(x,y,"Fade",obj_fade);
	fade.destino = dest;
	fade.xdest = xx;
	fade.ydest = yy;
	
	cutscene_action_end();
}

function cutscene_action_wait(seconds) {
	timer++;
	
	if timer >= game_get_speed(gamespeed_fps) * seconds {
		timer = 0;
		
		cutscene_action_end();
	}
}

function cutscene_action_dialogo(nome) {
	if !global.dialogo {
		global.dialogo = true;
		var inst = instance_create_layer(x,y,layer,obj_dialogo_final);
		inst.nick_npc = nome;
		inst.id_obj = self;
	}
}