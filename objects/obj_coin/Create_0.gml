/// @description

event_inherited();

start_image_speed = random_range(.25, .75);
timer = 0;
z = 0;

image_speed = start_image_speed;
direction	= random_range(190, 350);
speed		= random_range(2, 5);
friction	= .03;

bounce_amount = irandom_range(2, 4);
bounce_length = room_speed / speed * 4;

var _scale = .25;
if (instance_number(obj_chest) > 0) _scale = obj_chest.scale;
bounce_height = irandom_range(100, 150) * _scale;