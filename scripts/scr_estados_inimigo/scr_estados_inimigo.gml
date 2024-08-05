#region ESCOLHER ESTADO
function inimigo_escolher_estado() {
	inimigo_checar_player();
	
	next_state = choose(inimigo_parado,inimigo_andando);
	
	if next_state == inimigo_parado {
		state = inimigo_parado;
	} else if next_state == inimigo_andando {
		xdest = irandom_range(x-300,x+300);
		ydest = y;
		
		xdest = clamp(xdest,xmin,xmax);
		state = inimigo_andando;
	}
}
#endregion ESCOLHER ESTADO

#region PARADO
function inimigo_parado() {
	st_state = "IDLE";
	image_speed = .8;
	hspd = 0;
	
	inimigo_movement();
	
	detectar_sprite(Sprites.Idle,sprites_inimigos);
	//inimigo_colisao();
	//inimigo_checar_player();
}
#endregion PARADO

#region ANDAR
function inimigo_andando() {
	st_state = "WALK";
	image_speed = 1;
	
	dir = point_direction(x,y,xdest,ydest);
	hspd = lengthdir_x(spd,dir);
	
	detectar_sprite(Sprites.Walk,sprites_inimigos);
	
	if point_distance(x,y,xdest,ydest) <= spd {
		x = xdest;
		y = ydest;
		hspd = 0;
		detectar_sprite(Sprites.Idle,sprites_inimigos);
	}
	
	inimigo_movement();
	
	//inimigo_colisao();
	//inimigo_checar_player();
}
#endregion ANDAR

#region PERSEGUIÇÃO
function inimigo_perseguir() {
	st_state = "PERSEGUIR";
	image_speed = 1.2;
	alarme = irandom_range(100, 260);
	
	xdest = obj_player.x;
	ydest = y;
	
	if point_distance(x,y,xdest,ydest) <= spd {
		x = xdest + irandom_range(-2, 2);
		y = ydest;
	}
	
	if bbox_bottom < obj_player.bbox_top or bbox_top > obj_player.bbox_bottom {
		perseguir = false;
		state = inimigo_parado;
	}
	
	dir = point_direction(x,y,xdest,ydest);
	hspd = lengthdir_x(spd,dir);
	
	//vspd += gravidade;
	//dir_spr = floor((dir + 90)/180);
	//if dir_spr >= 2 {dir_spr = 0};
	
	inimigo_movement();
	
	detectar_sprite(Sprites.Walk,sprites_inimigos);
	//inimigo_colisao();
	//inimigo_checar_player();
	
	
}

function inimigo_pos_perseguir() {
	st_state = "POS-PERSEGUIR";
	//inimigo_checar_player();
	alarme = irandom_range(100, 260);
	
	//dir = point_direction(x,y,xdest,ydest);
	//dir_spr = floor((dir + 90)/180);
	//if dir_spr >= 2 {dir_spr = 0};
	
	hspd = lengthdir_x(spd,dir);
	//vspd+=gravidade;
	detectar_sprite(Sprites.Walk,sprites_inimigos);
	inimigo_movement();
	
	if point_distance(x,y,xdest,ydest) <= 3 or place_meeting(x+hspd,y+1,obj_quina) {
		hspd = 0;
		xdest = x;
		ydest = y;
		perseguir = false;
		state = inimigo_escolher_estado;
	}
	
	//inimigo_colisao();
}
#endregion PERSEGUIÇÃO

#region ATACAR
function inimigo_atacar() {
	st_state = "ATTACK";
	image_speed = 1;
	detectar_sprite(Sprites.Attack,sprites_inimigos);
	alarme = irandom_range(100, 260);
	
	var players_na_hitbox = ds_list_create();
	
	var players = instance_place_list(x,y,obj_player_hb,players_na_hitbox,false);
	
	if players > 0 {
		for (var i = 0; i < players; i++) {
			var id_p = players_na_hitbox[| i];
			
			if ds_list_find_index(players_atingidos, id_p) == -1 {
				ds_list_add(players_atingidos, id_p);
				
				with (id_p.id_p) {
					if state != player_dash {
						hit = true;
						alarm[3] = 6;
						knockback_dir = point_direction(other.x,obj_player.y,obj_player.x,obj_player.y);
						state = player_empurrado;
					
						vida -= other.dano;
						if vida <= 0 {
							if global.checkpoint == noone {
								game_restart();
							} else {
								vida = vida_maxima;
								room_goto(global.checkpoint[0]);
								obj_player.x = global.checkpoint[1];
								obj_player.y = global.checkpoint[2];
							}
						}
					}
				}
			}
		}
	}
	
	ds_list_destroy(players_na_hitbox);
	
	if fim_animacao() {
		detectar_sprite(Sprites.Idle,sprites_inimigos);
		mask_index = sprite_index;
		//ACIONAR COOLDOWN DO GOLPE
		alarm[0] = cooldown_atacar;
		//VOLTAR AO ESTADO PADRÃO
		state = inimigo_andando;
	}
}
#endregion ATACAR

#region EMPURRADO
function inimigo_empurrado() {
	knockback_spd = lerp(knockback_spd,0,.05);
	detectar_sprite(Sprites.Idle,sprites_inimigos);
	mask_index = sprite_index;
	
	hspd += lengthdir_x(knockback_spd, knockback_dir);
	//vspd-=lerp(2,0,.05);
	
	inimigo_colisao();
}
#endregion EMPURRADO