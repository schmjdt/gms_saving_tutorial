/// @description 

randomize();

scale = 1;

image_speed  = 0;
image_xscale = scale;
image_yscale = scale;

enum States {
	closed,
	opening,
	open,
	already_opened
};

key = save_data_generate_key();

var _save_data = game.save_data[? key];

if (!is_undefined(_save_data) and _save_data == true) {
	state = States.already_opened;	
} else {
	state = States.closed;
}

timer = 0;
