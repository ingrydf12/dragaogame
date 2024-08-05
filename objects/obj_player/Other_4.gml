if room != rm_cutscene_porto_final {
	instance_create_layer(x,y,"Variaveis",obj_camera);
	var hb = instance_create_layer(x,y,"Player",obj_player_hb);
	hb.id_p = self;
	hb.image_xscale = image_xscale;
	hb.image_yscale = image_yscale;
} else {
	instance_destroy();
}