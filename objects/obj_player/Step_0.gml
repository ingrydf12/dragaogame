#region PAUSE
if global.pause {
	image_speed = 0;
	exit;
}
image_speed = 1;
#endregion PAUSE

quina_count++;

if !global.dialogo and !global.cutscene and !instance_exists(obj_fade) {
	inputs_check();
	
	//if keyboard_check_pressed(ord("V")) {room_goto(rm_cutscene_porto_final); x = 7100; y = 1200}
	//if keyboard_check_pressed(ord("R")) {game_restart()}
	
	script_execute(state);
}