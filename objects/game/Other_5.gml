/// @description save coins

var _coins = ds_grid_create(Coins._length, 0);

with (obj_coin) {
	var _row = ds_grid_add_row(_coins);
	
	_coins[# Coins.x, _row]					= x;
	_coins[# Coins.y, _row]					= y;
	_coins[# Coins.start_image_speed, _row] = start_image_speed;
	_coins[# Coins.timer, _row]				= timer;
	_coins[# Coins.direction, _row]			= direction;
	_coins[# Coins.speed, _row]				= speed;
	_coins[# Coins.bounce, _row]			= bounce_amount;
	_coins[# Coins.bounce_height, _row]		= bounce_height;	
}

var _key = room_get_name(room) + "coins";

ds_map_replace(save_data, _key, ds_grid_write(_coins));

ds_grid_destroy(_coins);