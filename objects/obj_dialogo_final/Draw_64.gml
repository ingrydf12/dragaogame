var gw = display_get_gui_width();
var gh = display_get_gui_height();

var margin = 80;
var c = c_black;

if interagir {
	var strg = dialogo[# DialogoInfos.Dialogo, pagina];
	var lado = dialogo[# DialogoInfos.Lado, pagina];
	//var nome = dialogo[# DialogoInfos.Nome, pagina];
	var strg_dialogo = string_copy(strg,0,caractere);
	
	draw_set_font(fnt_retro_final);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_set_color(c);
	
	switch lado {
		default: //BAIXO
		draw_set_color(c_white);
			draw_rectangle_color(0,gh-string_height(strg)-180,gw,gh,c,c,c,c,false);
			draw_text_ext(gw/2,gh-string_height(strg)-50,strg_dialogo,font_get_size(fnt_retro_final),gw-(margin*2));
			break;
		case 1: //MEIO
			draw_rectangle_color(0,0,gw,gh,c,c,c,c,false);
			draw_set_color(c_white);
			draw_text_ext(gw/2,gh/2,strg_dialogo+cursor,font_get_size(fnt_retro_final),gw-(margin*2));
			break;
	}
	draw_set_color(c_white);
	draw_set_font(-1);
	draw_set_valign(-1);
	draw_set_halign(-1);
}