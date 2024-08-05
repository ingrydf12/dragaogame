if keyboard_check_pressed(vk_escape) {global.pause = !global.pause}

if instance_exists(obj_dialogo) or instance_exists(obj_dialogo_final) {global.dialogo = true} else {global.dialogo = false}

if global.jangadeiros_achados >= 5 and !global.dialogo {
	global.jangadeiros_achados = 0;
	global.checkpoint[0] = rm_inicio_porto;
	global.checkpoint[1] = 992;
	global.checkpoint[2] = 544;
	instance_create_layer(x,y,layer,obj_cutscene_cidade);
}