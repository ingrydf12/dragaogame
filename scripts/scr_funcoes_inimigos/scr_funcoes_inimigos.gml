#region VERIFICAR QUINA
function inimigo_colisao_quina(){ 
	if place_meeting(x + hspd, y+1, obj_quina) {
		state = inimigo_escolher_estado;
		
		hspd = 0;
	}
}
#endregion VERIFICAR QUINA

#region COLISÃO
function inimigo_colisao() {
	
	if place_meeting(x + hspd, y, obj_colisao) {
		while !place_meeting(x + sign(hspd), y, obj_colisao) {
			x+=sign(hspd);
		}
		
		state = inimigo_escolher_estado;
		
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
function inimigo_movement() {
	vspd += gravidade;
	
	//DIREÇÃO DE MOVIMENTAÇÃO
	dir = point_direction(x, y, x + hspd, y);
	
	if hspd != 0 {
		dir_spr = floor((dir + 90)/180);
		if dir_spr >= 2 {dir_spr = 0};
		spd = walk_spd;
	}
	
	//VERIFICAR COLISÃO
	inimigo_colisao();
	inimigo_colisao_quina();
	inimigo_checar_player();
	
}
#endregion

#region CHECAR PLAYER
function inimigo_checar_player() {
	if instance_exists(obj_player) {
		switch dir_spr {
			default:
				if !atacar {
					if point_distance(x,y,obj_player.x,obj_player.y) <= view_range {
						if point_distance(x,y,obj_player.x,obj_player.y) <= danger_range {
							if collision_line(x,y,x+view_range,y,obj_player,false,true) {
								if point_distance(x,y,obj_player.x,obj_player.y) <= atk_range and !atacar {
									switch dir_spr {
										default: //DIREITA
											mask_index = spr_inimigo_atk_right_hb;
											break;
										case 1: //ESQUERDA
											mask_index = spr_inimigo_atk_left_hb;
											break;
									}
									
									ds_list_clear(players_atingidos);
									atacar = true;
									detectar_sprite(Sprites.Attack,sprites_inimigos);
									image_index = 0;
									state = inimigo_atacar;
								}
							} else {
								perseguir = true;
								state = inimigo_perseguir;
							}
						}
					}
				}
				break;
			case 1:
				if !atacar {
					if point_distance(x,y,obj_player.x,obj_player.y) <= view_range {
						if point_distance(x,y,obj_player.x,obj_player.y) <= danger_range {
							if collision_line(x,y,x-view_range,y,obj_player,false,true) {
								if point_distance(x,y,obj_player.x,obj_player.y) <= atk_range and !atacar {
									switch dir_spr {
										default: //DIREITA
											mask_index = spr_player_atk_right_hb;
											break;
										case 1: //ESQUERDA
											mask_index = spr_player_atk_left_hb;
											break;
									}
									
									ds_list_clear(players_atingidos);
									atacar = true;
									detectar_sprite(Sprites.Attack,sprites_inimigos);
									image_index = 0;
									state = inimigo_atacar;
								}
							} else {
								perseguir = true;
								state = inimigo_perseguir;
							}
						}
					}
				}
				break;
		}
	}
}
#endregion CHECAR PLAYER