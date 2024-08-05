
if perto {
	if !salvo {
		draw_sprite(spr_balao_interagir,0,x,bbox_top);
	} else {
		draw_sprite(spr_balao_fala,0,x,bbox_top);
	}
}

draw_self();