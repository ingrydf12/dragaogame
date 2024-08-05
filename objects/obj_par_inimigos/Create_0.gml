randomize();

walk_spd = 4;
spd = walk_spd;
gravidade = .55;
hspd = -1;
vspd = -1;
dir = -1;
dir_spr = 0;

xdest = -1;
ydest = -1;
xmin = x-300;
xmax = x+300;

danger_range = 350;
view_range = 800;
perseguir = false;

players_atingidos = ds_list_create();
atacar = false;
atk_range = 140;
cooldown_atacar = irandom_range(40,80);
dano = 1;
vida_maxima = 3;
vida = vida_maxima;

hit = false;
knockback_dir = -1;
knockback_spd = 8;

image_xscale = .4;
image_yscale = .4;

st_state = "IDLE";
next_state = -1
state = inimigo_escolher_estado;

alarme = 1;

sprites_inimigos = [
	//	SPRITES IDLE
	[spr_inimigo_idle_right,
	spr_inimigo_idle_left],
	//	SPRITES WALK
	[spr_inimigo_walk_right,
	spr_inimigo_walk_left],
	//	SPRITES JUMP
	[spr_inimigo_walk_right,
	spr_inimigo_walk_left],
	//	SPRITES ATTACK
	[spr_inimigo_atk_right,
	spr_inimigo_atk_left]
]

var hb = instance_create_layer(x,y,"Inimigos",obj_inimigo_hb);
hb.id_p = self;
hb.image_xscale = image_xscale;
hb.image_yscale = image_yscale;