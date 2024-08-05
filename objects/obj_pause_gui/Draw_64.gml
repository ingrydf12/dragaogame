var gw = display_get_gui_width();
var gh = display_get_gui_height();
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var escala = 8;
var c = c_black;

if global.pause {
	draw_set_alpha(.5);
	draw_rectangle_color(0,0,gw,gh,c,c,c,c,false);
	draw_set_alpha(1);
	
	var xx_cont = 50;
	var yy_cont = gh/2 - 80;
	var wspr_cont = sprite_get_width(spr_menu_continuar_ingame) * escala;
	var hspr_cont = sprite_get_height(spr_menu_continuar_ingame) * escala;
	
	if point_in_rectangle(mx,my,xx_cont,yy_cont,xx_cont+wspr_cont,yy_cont+hspr_cont) {
		if mouse_check_button_pressed(mb_left) {global.pause = false}
		draw_sprite_ext(spr_menu_continuar_ingame,1,xx_cont,yy_cont,escala,escala,0,c_white,1);
	} else {
		draw_sprite_ext(spr_menu_continuar_ingame,0,xx_cont,yy_cont,escala,escala,0,c_white,1);
	}
	
	var xx_sair = 50;
	var yy_sair = gh/2 + 80;
	var wspr_sair = sprite_get_width(spr_menu_sair_ingame) * escala;
	var hspr_sair = sprite_get_height(spr_menu_sair_ingame) * escala;
	
	if point_in_rectangle(mx,my,xx_sair,yy_sair,xx_sair+wspr_sair,yy_sair+hspr_sair) {
		if mouse_check_button_pressed(mb_left) {game_end()}
		draw_sprite_ext(spr_menu_sair_ingame,1,xx_sair,yy_sair,escala,escala,0,c_white,1);
	} else {
		draw_sprite_ext(spr_menu_sair_ingame,0,xx_sair,yy_sair,escala,escala,0,c_white,1);
	}
}