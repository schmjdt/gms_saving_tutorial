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

state = States.closed;

timer = 0;