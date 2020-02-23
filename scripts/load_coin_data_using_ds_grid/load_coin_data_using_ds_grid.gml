var _key = room_get_name(room) + "coins";

var _str = save_data[? _key];

if (_str == undefined) exit;

var _coins = ds_grid_create(0, 0);
ds_grid_read(_coins, _str);

var _gh = ds_grid_height(_coins);
var yy = 0;

repeat (_gh) {
	var _inst = instance_create_layer(0, 0, "Instances", obj_coin);
	
	with (_inst) {
		x					= _coins[# Coins.x, yy];
		y					= _coins[# Coins.y, yy];
		image_speed			= _coins[# Coins.image_speed, yy];
		start_image_speed	= _coins[# Coins.start_image_speed, yy];
		direction			= _coins[# Coins.direction, yy];
		speed				= _coins[# Coins.speed, yy];
		bounce_amount		= _coins[# Coins.bounce_amount, yy];
		bounce_height		= _coins[# Coins.bounce_height, yy];
		timer				= _coins[# Coins.timer, yy];
	}
	
	yy += 1;
}

ds_grid_destroy(_coins);