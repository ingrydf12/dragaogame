
if !interagir {
	textos_dialogos();
	interagir = true;
}

if mouse_check_button_pressed(mb_left) or gamepad_button_check_pressed(global.gamepad_id, gp_shoulderrb) {
	if caractere < string_length(dialogo[# DialogoInfos.Dialogo, pagina]) {
		caractere = string_length(dialogo[# DialogoInfos.Dialogo, pagina]);
	} else {
		alarm[0] = delay_caractere;
		caractere = 0;
		
		if pagina < ds_grid_height(dialogo) - 1 {
			pagina++;
		} else {
			instance_destroy();
		}
	}
}