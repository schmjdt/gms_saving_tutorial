/// @description 

depth = -y;
var _pos = timer / bounce_length;

if (_pos <= 1) {
	z = arc(0, bounce_height, 0, _pos, .8);
} else if (bounce_amount > 0) {
	bounce_amount -= 1;
	bounce_height /= 2;
	bounce_length /= 2;
	timer = 0;
	z = 0;
} else if (timer < room_speed * 2) {
	z = 0;
	image_speed = lerp_clamped(start_image_speed, 0, timer / room_speed);
	image_alpha = lerp(1, 0, timer * .5 / room_speed);
} else {
	instance_destroy();
}

timer += 1;