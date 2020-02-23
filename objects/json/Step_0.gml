/// @description 

if (mouse_check_button_pressed(mb_left)) {
	// Create instance of coin at mouse 
	var _inst = instance_create_layer(mouse_x, mouse_y, "Instances", obj_coin);
	
	_inst.image_blend = make_colour_hsv(irandom_range(100, 255), irandom_range(100, 255), irandom_range(100, 255));
}