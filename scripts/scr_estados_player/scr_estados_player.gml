#region PARADO
function player_parado() {
	debug_spr_string = "IDLE";
	
	//VERIFICAR MOVIMENTAÇÃO
	player_movement();
	image_speed = .8;
	//MUDAR SPRITE
	detectar_sprite(Sprites.Idle,sprites_player);
	//VERIFICAR SE ESTÁ ATACANDO
	detectar_ataque();
	//detectar_agachamento();
	detectar_escalada();
	detectar_dash();
}
#endregion PARADO

#region ANDANDO
function player_andar() {
	debug_spr_string = "ANDAR";
	
	//VERIFICAR MOVIMENTAÇÃO
	player_movement();
	image_speed = 1;
	//MUDAR SPRITE
	detectar_sprite(Sprites.Walk,sprites_player);
	//VERIFICAR SE ESTÁ ATACANDO
	detectar_ataque();
	//detectar_agachamento()
	detectar_escalada();
	detectar_dash();
}
#endregion ANDANDO

#region PULANDO
function player_pulando() {
	debug_spr_string = "PULO";
	
	player_movement();
	
	image_speed = 1;
	//MUDAR SPRITE
	detectar_sprite(Sprites.Jump,sprites_player);
	
	detectar_escalada();
	detectar_dash();
}
#endregion PULANDO

#region AGARRANDO
function player_agarrado() {
	debug_spr_string = "AGARRAR";
	
	y = lerp(y, parede.bbox_top,.2);
	
	//VERIFICAR MOVIMENTAÇÃO
	detectar_pulo();
	
	image_speed = 1;
	//MUDAR SPRITE
	detectar_sprite(Sprites.Idle,sprites_player);
}
#endregion AGARRADO

#region DASH
function player_dash() {
	debug_spr_string = "DASH";
	hspd += lengthdir_x(dash_spd, dash_dir);
	vspd = 0;
	
	instance_create_layer(x,y,"Player",obj_vulto,{
		image_xscale : obj_player.image_xscale,
		image_yscale : obj_player.image_yscale,
		image_speed : 0,
		image_alpha : .6,
		sprite_index : obj_player.sprite_index
	})
	
	detectar_escalada();
	colisao();
}
#endregion DASH

#region ATACANDO
function player_atacar() {
	debug_spr_string = "ATACAR";
	//image_speed = 1.2;
	
	var inimigos_na_hitbox = ds_list_create();
	
	var inimigos = instance_place_list(x,y,obj_inimigo_hb,inimigos_na_hitbox,false);
	
	if inimigos > 0 {
		for (var i = 0; i < inimigos; i++) {
			var inimigo_id = inimigos_na_hitbox[| i];
			
			if ds_list_find_index(inimigos_atingidos, inimigo_id) == -1 {
				ds_list_add(inimigos_atingidos, inimigo_id);
				
				with (inimigo_id.id_p) {
					hit = true;
					alarm[0] = 20;
					alarm[1] = 6;
					knockback_dir = point_direction(obj_player.x,y,x,y);
					state = inimigo_empurrado;
					//state = inimigo_perseguir;
					vida -= other.dano;
					if vida <= 0 {
						//part_particles_create(part_blood,x,y,0,1);
						effect_create_above(ef_explosion,x,y,.6,c_white);
						instance_destroy();
						instance_destroy(inimigo_id);
					}
				}
			}
		}
	}
	
	ds_list_destroy(inimigos_na_hitbox);
	
	if fim_animacao() {
		detectar_sprite(Sprites.Idle,sprites_player);
		mask_index = sprites_player[Sprites.Idle][dir_spr];
		//ACIONAR COOLDOWN DO GOLPE
		//alarm[0] = cooldown_atacar;
		atacar = false;
		//VOLTAR AO ESTADO PADRÃO
		state = player_parado;
	}
}
#endregion ATACANDO

#region EMPURRADO
function player_empurrado() {
	knockback_spd = lerp(knockback_spd,0,.05);
	detectar_sprite(Sprites.Idle,sprites_player);
	mask_index = sprite_index;
	
	hspd += lengthdir_x(knockback_spd, knockback_dir);
	//vspd-=lerp(2,0,.05);
	//vspd+=gravidade;
	
	colisao();
}
#endregion EMPURRADO

#region AGACHANDO
//function player_agachar() {
//	debug_spr_string = "AGACHAR";
	
//	//VERIFICAR MOVIMENTAÇÃO
//	player_movement();
//	image_speed = .8;
//	//MUDAR SPRITE
//	detectar_sprite(Sprites.Idle,sprites_player);
//	detectar_agachamento();
//	detectar_ataque();
//}
#endregion AGACHAR

#region ESCALANDO
function player_escalando() {
	debug_spr_string = "ESCALAR";
	
	hspd = 0;
	vspd = 0;
	
	if place_meeting(x,y,obj_escada) {
		if up {
			vspd = escalada_spd;
		} else if down {
			vspd = -escalada_spd;
		}
	} else {
		escalar = false;
		state = player_andar;
	}
	
	image_speed = .8;
	//MUDAR SPRITE
	detectar_sprite(Sprites.Idle,sprites_player);
	
	player_movement();
}
#endregion