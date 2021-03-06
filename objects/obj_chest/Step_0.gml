/// @description 

switch (state) {
	case States.closed:
		//Check for clicks
		if (mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y,id)) {
			timer = 0;
			state = States.opening;
			// TODO: Won't save the state of mid-coinage if saved during chest opening
			ds_map_replace(game.save_data, key, true);
		}
		break;
	case States.opening:
		timer++;
		if (timer = 5) {
			image_index=1;
		} else if (timer = 10) {
			state = States.open;
			timer = 0;
			image_index = 2;
		}
		break;
	case States.open:
		timer++;
		if (timer mod 2 == 0) {
			var inst = instance_create_layer(x, y, "Instances", obj_coin);
			inst.image_xscale = scale;
			inst.image_yscale = scale;
		}
    
		if (timer > room_speed * 1) {
			state = States.already_opened;
			timer = 0;
		}
		break;
	case States.already_opened:
		image_index = 2;
		break;
}