//var c = c_green;
//draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c,c,c,c,false);

if hit {
	gpu_set_fog(true,c_white,0,0);
	draw_self();
	gpu_set_fog(false,c_white,0,0);
} else {
	draw_self();
}