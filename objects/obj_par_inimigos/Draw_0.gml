
//var lado = dir_spr;
//switch lado {
//	default:
//		lado = 1;
//		break;
//	case 1:
//		lado = -1;
//		break;
//}

//draw_line_color(x,y,x+(danger_range*lado),y,c_black,c_black)
//draw_text(x,y-(image_xscale*20),st_state)
//draw_text(x,y-(image_xscale*25),dir_spr)
//var c = c_green;
//draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c,c,c,c,false);

if hit {
	gpu_set_fog(true,c_white,0,0);
	draw_self();
	gpu_set_fog(false,c_white,0,0);
} else {
	draw_self();
}

