event_inherited();

if instance_exists(seguidor) {
	if seguidor != noone {
		dest_x = seguidor.x;
		dest_y = seguidor.y;
	}
	
	x = lerp(x, seguidor.x, .05);
	y = lerp(y, seguidor.y, .05);
	
	camera_set_view_pos(view_camera[0],x-(cam_w*.5),y-(cam_h*.5))
}