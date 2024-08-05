var p = obj_player;

if instance_exists(p) {
	if bbox_right < p.bbox_left {instance_destroy();
	}
}