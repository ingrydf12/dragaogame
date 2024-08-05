
debug_spr_string = "IDLE"

xoffset = sprite_get_xoffset(spr_player_hitbox)
yoffset = sprite_get_yoffset(spr_player_hitbox)
sprite_set_offset(sprite_index, xoffset, yoffset);

//sprite_set_bbox(sprite_index,21,18,26,31);

rigth =				-1;
left =				-1;
up =				-1;
jump =				-1;
hold_jump =			-1;
down =				-1;
tecla_atk =			-1;
tecla_interagir =	-1;
tecla_dash =		-1;
//tecla_agachar =		-1;

pulou = false;
jump_spd = -7;
jump_max = 1;
jump_count = 0;
gravidade = .55;

jump_hold_frames = 15;
jump_timer = 0;

walk_spd = 6;
spd = walk_spd;
hspd = -1;
vspd = -1;

parede = noone;
quina_count = 0;

escalar = false;
escalada_spd = -3;
subir = false;
subida_spd = -8;

dir = 0;
dir_spr = 0;

vida_maxima = 4;
vida = vida_maxima;
atacar = false;
cooldown_atacar = 14;
dano = 1;

hit = false;
knockback_dir = -1;
knockback_spd = 8;

inimigos_atingidos = ds_list_create();

dash = true;
dash_cooldown = 20;
dash_duration = 5;
dash_dir = -1;
dash_spd = 5;

agachar = false;
agachar_spd = 3;

image_xscale = .4;
image_yscale = .4;

sprites_player = [
	//	SPRITES IDLE
	[spr_player_idle_right,
	spr_player_idle_left],
	//	SPRITES WALK
	[spr_player_walk_right,
	spr_player_walk_left],
	//	SPRITES JUMP
	[spr_player_jump_right,
	spr_player_jump_left],
	//	SPRITES ATTACK
	[spr_player_atk_right,
	spr_player_atk_left]
]

state = player_parado;