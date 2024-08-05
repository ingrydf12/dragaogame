var gw = display_get_gui_width();
var gh = display_get_gui_height();

var margin = 15;
var xx = 10;
var yy = 240;
var c = c_black;

if interagir {
	var strg = dialogo[# DialogoInfos.Dialogo, pagina];
	var lado = dialogo[# DialogoInfos.Lado, pagina];
	var nome = dialogo[# DialogoInfos.Nome, pagina];
	var strg_dialogo = string_copy(strg,0,caractere);
	
	draw_set_font(fnt_retro);
	draw_rectangle_color(xx,0,gw-xx,yy,c,c,c,c,false);
	draw_text_ext(xx+margin,margin,strg_dialogo,32,gw-(margin*2)-(xx*2));
	
	var yquad_nome = yy+string_height(nome)+margin*2;
	switch lado {
		default: //ESQUERDA
			draw_rectangle_color(xx,yy,xx+string_width(nome)+margin*2,yquad_nome,c,c,c,c,false);
			draw_text_ext(xx+margin,yy+margin,nome,32,gw-(margin*2)-(xx*2));
			break;
		case 1: //DIREITA
			draw_set_halign(fa_right);
			draw_rectangle_color(gw-xx-string_width(nome)-margin*2,yy,gw-xx,yquad_nome,c,c,c,c,false);
			draw_text_ext(gw-xx-margin,yy+margin,nome,32,gw-(margin*2)-(xx*2));
			draw_set_halign(-1);
			break;
	}
	draw_set_font(-1);
}