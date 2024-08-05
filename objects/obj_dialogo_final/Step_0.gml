
if !interagir {
	textos_dialogos();
	interagir = true;
}

var strg = dialogo[# DialogoInfos.Dialogo, pagina];
var strg_dialogo = string_copy(strg,0,caractere);

if alarm[2] <= 0 and caractere >= string_length(dialogo[# DialogoInfos.Dialogo, pagina]) {alarm[2] = 240}

if passar {
	passar = false;
	
	if caractere >= string_length(dialogo[# DialogoInfos.Dialogo, pagina]) {
		alarm[0] = delay_caractere;
		caractere = 0;
		
		if pagina < ds_grid_height(dialogo) - 1 {
			pagina++;
		} else {
			with(id_obj) {
				cutscene_action_end();
			}
			game_end();
			instance_destroy();
		}
	}
}