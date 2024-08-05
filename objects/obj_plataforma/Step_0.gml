var p = obj_player;

if instance_exists(p) {
	var sph_p = sprite_get_height(p.sprite_index);
	var sph = sprite_get_height(spr_plataformas)*image_yscale;
	
	if p.x >= x and p.x <= x+(sprite_get_width(spr_plataformas)*image_xscale) {
		if sprite_index == noone and !p.escalar {
			if p.bbox_top < y+sph/2 {
				if p.up or p.hold_jump {
					p.subir = true;
				}
			}
		}
	}

	if bbox_bottom >= p.bbox_bottom {
		sprite_index = spr_colisao;
		with(p) {
			if down {//or tecla_agachar {
				other.sprite_index = noone;
			}
		}
	} else {
		sprite_index = noone;
	}
}