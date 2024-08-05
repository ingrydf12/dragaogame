
#region ANIMAÇÕES
function fim_animacao() {
	/// @description animation_end(sprite_index,image_index, rate)
	/// @param {real} <sprite_index> The index of the sprite being animated
	/// @param {real} <image_index> The current frame value
	/// @param {real} <rate> -See Below-
	///		The rate of change in frames per step if not
	///		using built in image_index/image_speed.
	///		Don't use if you don't think you need this. You probably don't.
	
	//returns true if the animation will loop this step.
	
	//Script courtesy of PixellatedPope & Minty Python from GameMaker subreddit discord
	//https://www.reddit.com/r/gamemaker/wiki/discord
	
	var _sprite = sprite_index;
	var _image = image_index;
	if(argument_count > 0) _sprite = argument[0];
	if(argument_count > 1) _image = argument[1];
	var _type = sprite_get_speed_type(sprite_index);
	var _spd = sprite_get_speed(sprite_index)*image_speed;
	if (_type == spritespeed_framespersecond)
		_spd = _spd/game_get_speed(gamespeed_fps);
		if(argument_count > 2) _spd = argument[2];
		return _image + _spd >= sprite_get_number(_sprite);
}
#endregion ANIMAÇÕES

#region CONTROLE
function gamepad_connect() {
	var gamepad_count = gamepad_get_device_count();
	
	for (var i = 0; i < gamepad_count; i++) {
		if gamepad_is_connected(i) {
			if keyboard_check(vk_anykey) {show_debug_message(keyboard_lastkey)}
			
			//show_debug_message(global.gamepad_id)
			global.gamepad_id = i;
			gamepad_set_axis_deadzone(global.gamepad_id, AXIS_DEADZONE);
			return true;
		}
	}
	
	return false;
}
#endregion CONTROLE

#region GRID
function ds_grid_add_row() {
	///@arg grid
	var grid = argument[0];
	ds_grid_resize(grid,ds_grid_width(grid),ds_grid_height(grid)+1);
	return(ds_grid_height(grid)-1);
}

function ds_grid_add_dialogo() {
	///@arg texto
	///@arg retrato
	///@arg lado
	///@arg nome
	
	var grid = dialogo;
	var yy = ds_grid_add_row(grid);
	
	for (var i = 0; i < ds_grid_width(grid); i++) {
		grid[# i, yy] = argument[i];
	}
}
#endregion GRID