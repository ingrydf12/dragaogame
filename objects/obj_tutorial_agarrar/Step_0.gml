var p = obj_player;

if instance_exists(obj_tutorial_movimento) or instance_exists(obj_tutorial_interacao) {
		visible = false;
	} else {
		visible = true;
	}

if instance_exists(p) {
	if bbox_right < p.bbox_left {
		instance_destroy();
	}
}