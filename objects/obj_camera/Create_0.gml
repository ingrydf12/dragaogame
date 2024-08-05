seguidor = obj_player;

if instance_exists(seguidor) {
	x = seguidor.x;
	y = seguidor.y;
}

cam_w = camera_get_view_width(view_camera[0]);
cam_h = camera_get_view_height(view_camera[0]);

dest_x = x;
dest_y = y;

yborda = 230;