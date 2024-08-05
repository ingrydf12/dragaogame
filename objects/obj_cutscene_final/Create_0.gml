global.cutscene = true;
instance_create_layer(0,0,"Imagens",obj_fotos_cutscene);
cutscene = -1;

action = 0;
timer = 0;

cutscene = [
	[cutscene_action_wait,1],
	[cutscene_action_dialogo, "Final Jogo"]
]