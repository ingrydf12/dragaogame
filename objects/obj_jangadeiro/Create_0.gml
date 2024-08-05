sprites_jangadeiros = [
	spr_jangadeiro
]

spr_id = id_jangadeiro

if spr_id >= array_length(sprites_jangadeiros) {spr_id = array_length(sprites_jangadeiros)-1}

sprite_index = sprites_jangadeiros[spr_id];
image_xscale = .5;
image_yscale = .5;

perto = false;
salvo = false;
dialogar = false;

hspd = -1;
vspd = -1;
gravidade = .55;

npc_nome = "jangadeiro"+string(id_jangadeiro);