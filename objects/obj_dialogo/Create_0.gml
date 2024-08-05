enum DialogoInfos {
	Dialogo,
	Lado,
	Nome,
	Altura
}

nick_npc = "";
dialogo = ds_grid_create(DialogoInfos.Altura,0);
pagina = 0;

interagir = false;

caractere = 0;
delay_caractere = 3;
sound_dialogo = -1;
alarm[0] = delay_caractere;