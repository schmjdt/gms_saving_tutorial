/// @description

///Change rooms
switch (state) {
	case Trans_State.none:
		var _left	= keyboard_check_pressed(vk_left);
		var _right	= keyboard_check_pressed(vk_right);
		var _up		= keyboard_check_pressed(vk_up);
		var _down	= keyboard_check_pressed(vk_down);
    
		if (_left || _right || _up || _down) state = Trans_State.out;
    
		switch (room) {
			case rm_middle:
				if (_left)  { target_room = rm_left;   trans_dir = Trans_Dir.left;  break; }
				if (_right) { target_room = rm_right;  trans_dir = Trans_Dir.right; break; }
				if (_up)    { target_room = rm_up;	   trans_dir = Trans_Dir.up;    break; }
				if (_down)  { target_room = rm_down;   trans_dir = Trans_Dir.down;  break; }
				break;
			case rm_up:
				if (_down)  { target_room = rm_middle; trans_dir = Trans_Dir.down;		   }
				else		  state = Trans_State.none;
				break;
			case rm_left:
				if (_right) { target_room = rm_middle; trans_dir = Trans_Dir.right;		   }
				else		  state = Trans_State.none;
				break;
			case rm_right:
				if (_left)  { target_room = rm_middle; trans_dir = Trans_Dir.left;         }
				else		  state = Trans_State.none;
				break;
			case rm_down:
				if (_up)	{ target_room = rm_middle; trans_dir = Trans_Dir.up;		   }
				else		  state = Trans_State.none;
				break;
		}
		
		break;
	default:		
		///Handle in and out transitions
		draw_set_color(c_black);
		transition_x = 0; 
		transition_y = 0;
		var _bias = .5;
		
		if (state == Trans_State.out) {			
			_bias = .8; 
			timer += 1;
   
			switch (trans_dir) {
				case Trans_Dir.up:    transition_y = interpolate(-room_height, 0, timer / transition_length, _bias); break;
				case Trans_Dir.down:  transition_y = interpolate(room_height,  0, timer / transition_length, _bias); break;
				case Trans_Dir.left:  transition_x = interpolate(-room_width,  0, timer / transition_length, _bias); break;
				case Trans_Dir.right: transition_x = interpolate(room_width,   0, timer / transition_length, _bias); break;
			}
		
			//We done yet?
			if (timer >= transition_length) {
				timer = transition_length;
				state = Trans_State.in;		
				
				// Save coin info on room transition
				save_coin_data_using_ds_grid();
				
				room_goto(target_room);				
			}
		} else if (state == Trans_State.in) {
			_bias = .2;
			timer -= 1;
      
			switch (trans_dir) {
				case Trans_Dir.down:    transition_y = interpolate(-room_height, 0, timer / transition_length, _bias); break;
				case Trans_Dir.up:		transition_y = interpolate(room_height,  0, timer / transition_length, _bias); break;
				case Trans_Dir.right:   transition_x = interpolate(-room_width,  0, timer / transition_length, _bias); break;
				case Trans_Dir.left:	transition_x = interpolate(room_width,   0, timer / transition_length, _bias); break;
			}
			
			//We done yet?
			if (timer <= 0) {
				timer = 0;
				state = Trans_State.none;
			}
		}
		
		break;
}