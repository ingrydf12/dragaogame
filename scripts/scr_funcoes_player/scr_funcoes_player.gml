#region INPUTS
function inputs_check() {
	//TECLAS
	right =					global.gamepad_id != noone and global.gamepad_id > 3 ? keyboard_check(vk_right) : keyboard_check(ord("D")) or gamepad_axis_value(global.gamepad_id, gp_axislh) > AXIS_DEADZONE;
	left =					global.gamepad_id != noone and global.gamepad_id > 3 ? keyboard_check(vk_left) : keyboard_check(ord("A")) or gamepad_axis_value(global.gamepad_id, gp_axislh) < -AXIS_DEADZONE;
	up =					global.gamepad_id != noone and global.gamepad_id > 3 ? keyboard_check(vk_up) : keyboard_check(ord("W"))	or gamepad_axis_value(global.gamepad_id, gp_axislv) < -AXIS_DEADZONE;
	down =					global.gamepad_id != noone and global.gamepad_id > 3 ? keyboard_check(vk_down) : keyboard_check(ord("S")) or gamepad_axis_value(global.gamepad_id, gp_axislv) > AXIS_DEADZONE;
	jump =					global.gamepad_id != noone and global.gamepad_id > 3 ? keyboard_check_pressed(vk_enter) : keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(global.gamepad_id, gp_face1);
	hold_jump =				global.gamepad_id != noone and global.gamepad_id > 3 ? keyboard_check(vk_enter) : keyboard_check(vk_space) or gamepad_button_check(global.gamepad_id, gp_face1);
	tecla_atk =				mouse_check_button_pressed(mb_left) or gamepad_button_check_pressed(global.gamepad_id, gp_shoulderrb);
	tecla_interagir =		global.gamepad_id != noone and global.gamepad_id > 3 ? keyboard_check_pressed(vk_pageup): keyboard_check_pressed(ord("E")) or gamepad_button_check_pressed(global.gamepad_id, gp_face3);
	tecla_dash =			global.gamepad_id != noone and global.gamepad_id > 3 ? mouse_check_button_pressed(mb_right) : keyboard_check_pressed(vk_shift) or gamepad_button_check_pressed(global.gamepad_id, gp_shoulderlb);
	//tecla_agachar =			global.gamepad_id != noone and global.gamepad_id > 3 ? keyboard_check_pressed(vk_shift) : keyboard_check_pressed(ord("S")) or gamepad_button_check_pressed(global.gamepad_id, gp_stickr);
	
	
	
	//right =					keyboard_check(ord("D")) or gamepad_axis_value(global.gamepad_id, gp_axislh) > AXIS_DEADZONE;
	//left =					keyboard_check(ord("A")) or gamepad_axis_value(global.gamepad_id, gp_axislh) < -AXIS_DEADZONE;
	//up =					keyboard_check(ord("W")) or gamepad_axis_value(global.gamepad_id, gp_axislv) < -AXIS_DEADZONE;
	//down =					keyboard_check(ord("S")) or gamepad_axis_value(global.gamepad_id, gp_axislv) > AXIS_DEADZONE;
	//jump =					keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(global.gamepad_id, gp_face1);
	//hold_jump =				keyboard_check(vk_space) or gamepad_button_check(global.gamepad_id, gp_face1);
	//tecla_atk =				mouse_check_button_pressed(mb_left) or gamepad_button_check_pressed(global.gamepad_id, gp_shoulderrb);
	//tecla_interagir =		keyboard_check_pressed(ord("E")) or gamepad_button_check_pressed(global.gamepad_id, gp_face3);
	//tecla_dash =			keyboard_check_pressed(vk_shift);
	//tecla_agachar =			keyboard_check_pressed(ord("S"));
}
#endregion INPUTS

#region COLISÃO
function colisao() {
	
	if place_meeting(x + hspd, y, obj_colisao) {
		while !place_meeting(x + sign(hspd), y, obj_colisao) {
			x+=sign(hspd);
		}
		
		hspd = 0;
	}
	x+=hspd;
	
	if place_meeting(x, y + vspd, obj_colisao) {
		while !place_meeting(x, y + sign(vspd), obj_colisao) {
			y+=sign(vspd);
		}
		
		vspd = 0;
	}
	y+=vspd;
	
}
#endregion COLISÃO

#region MOVIMENTAÇÃO
function player_movement() {
	//LADO (ESQUERDA OU DIREITA; CIMA OU BAIXO) DE MOVIMENTAÇÃO
	hspd = (right - left) * spd;
	
	if !escalar {
		if down {
			vspd += gravidade*2;
		} else {
			vspd += gravidade;
		}
	}
	
	//DIREÇÃO DE MOVIMENTAÇÃO
	dir = point_direction(x, y, x + hspd, y);
	
	if hspd != 0 {
		dir_spr = floor((dir + 90)/180);
		if dir_spr >= 2 {dir_spr = 0};
		
		spd = walk_spd;
		if !pulou and !escalar {state = player_andar}
		
		//if !agachar {
		//	spd = walk_spd;
		//	if !pulou and !escalar {state = player_andar}
		//} else {
		//	spd = agachar_spd;
			
		//	if !pulou and !escalar {state = player_agachar}
		//}
	} else {
		//ESTADO DE PARADO
		if !pulou and !escalar {state = player_parado}
	}
	
	if place_meeting(x, y+1, obj_colisao) {
		jump_count = 0;
		pulou = false;
		if atacar {
			atacar = false;
		}
			
		if alarm[2] <= dash_cooldown*.1 {
			dash = true;
		}
	} else {
		//if agachar {agachar = false}
		if jump_count == 0 {
			jump_count = 1
		}
			
		atacar = true;
		if !pulou {
			alarm[2] = dash_cooldown;
		}
	}
	
	if subir {
		vspd = subida_spd;
		hspd = 0;
		var plat = instance_nearest(x,y,obj_plataforma);
		
		if plat.bbox_bottom >= bbox_bottom {
			subir = false
			vspd = 0
		}
	}
	
	detectar_pulo();
	detectar_agarro();
	
	//VERIFICAR COLISÃO
	colisao();
}
#endregion MOVIMENTAÇÃO

#region DETECTAR DASH
function detectar_dash() {
	if tecla_dash and dash {
		dash = false;
		atacar = true;
		alarm[0] = cooldown_atacar;
		alarm[1] = dash_duration;
		alarm[2] = dash_cooldown;
		dash_dir = dir_spr*180;
	
		state = player_dash;
	}
}
#endregion DETECTAR DASH

#region DETECTAR AGACHAR
//function detectar_agachamento() {
//	if tecla_agachar {
//		agachar = !agachar;
		
//		if agachar {
//			state = player_agachar;
//		}
//	}
//}
#endregion DETECTAR AGACHAR

#region DETECTAR ESCALADA
function detectar_escalada() {
	if place_meeting(x,y,obj_escada) {
		if up {
			escalar = true;
			pulou = false;
			jump_count = 0;
			
			state = player_escalando;
		}
	} else {
		escalar = false;
	}
}
#endregion DETECTAR ESCALADA

#region DETECTAR PULO
function detectar_pulo() {
	if jump and jump_count < jump_max {
		pulou = true;
		jump_count++;
		
		//if agachar {agachar = false}
		if escalar {escalar = false}
		
		jump_timer = jump_hold_frames;
		state = player_pulando;
	}
	
	if !hold_jump {jump_timer = 0}
	
	if jump_timer > 0 {
		vspd = jump_spd;
		
		jump_timer--;
	}
}
#endregion DETECTAR PULO

#region DETECTAR AGARRO
function detectar_agarro() {
	if place_meeting(x + hspd, y, obj_colisao) {
		if quina_count > 10 {
			parede = instance_place(x+hspd,y,obj_quina);
			
			if parede != noone {
				if obj_player.bbox_top > parede.bbox_top and hold_jump {
					vspd = 0;
					jump_count = 0;
					
					dir_spr = floor((dir + 90)/180);
					if dir_spr >= 2 {dir_spr = 0};
					
					state = player_agarrado;
				}
			}
		}
	}
}
#endregion DETECTAR AGARRO

#region DETECTAR ATAQUE
function detectar_ataque() {
	if tecla_atk and !atacar {
		image_index = 0;
		image_speed = 1;
		//y-=5;
		ds_list_clear(inimigos_atingidos);
		
		detectar_sprite(Sprites.Attack,sprites_player);
		
		//if agachar {
		//	detectar_sprite(Sprites.Attack,sprites_player);
		//} else {
		//	detectar_sprite(Sprites.Attack,sprites_player);
		//}
		detectar_mask_index(dir_spr);
		
		atacar = true;
		dash = false;
		alarm[2] = dash_cooldown;
		state = player_atacar;
	}
}
#endregion DETECTAR ATAQUE

#region DETECTAR SPRITE
function detectar_sprite() {
	///@arg1 acao
	///@arg2 array
	
	var array = argument[1];
	sprite_index = array[argument[0]][dir_spr];
}
#endregion DETECTAR SPRITE

#region DETECTAR MASK INDEX
function detectar_mask_index(lado) {
	
	switch lado {
		default: //DIREITA
			mask_index = spr_player_atk_right_hb;
			break;
		case 1: //ESQUERDA
			mask_index = spr_player_atk_left_hb;
			break;
	}
	
	//if agachar {
	//	switch lado {
	//		default: //DIREITA
	//			mask_index = spr_player_atk_right_hb;
	//			break;
	//		case 1: //ESQUERDA
	//			mask_index = spr_player_atk_left_hb;
	//			break;
	//	}
	//} else {
	//	switch lado {
	//		default: //DIREITA
	//			mask_index = spr_player_atk_right_hb;
	//			break;
	//		case 1: //ESQUERDA
	//			mask_index = spr_player_atk_left_hb;
	//			break;
	//	}
	//}
}
#endregion DETECTAR MASK INDEX