event_inherited();

var p = obj_player;
perto = false;

if instance_exists(p) {
	if point_distance(x,y,p.x,p.y) <= 100 {
		perto = true;
		if p.tecla_interagir and !global.dialogo {
			with (p) {
				detectar_sprite(Sprites.Idle,sprites_player);
			}
			
			if !salvo {
				salvo = true;
				var inst = instance_create_layer(x,y,"Variaveis",obj_dialogo);
				inst.nick_npc = npc_nome;
				
				npc_nome = "jangadeiro"+string(id_jangadeiro)+" salvo";
				global.jangadeiros_achados++;
			} else {
				var inst = instance_create_layer(x,y,"Variaveis",obj_dialogo)
				inst.nick_npc = npc_nome;
			}
		}
	}
}

hspd = 0;
vspd += gravidade;

colisao();