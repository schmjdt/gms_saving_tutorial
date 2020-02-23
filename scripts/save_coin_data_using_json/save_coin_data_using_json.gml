/// @desc save_coin_data_using_json
/// @arg filename

var _filename = argument[0];

// Create a root list
var _root_list = ds_list_create();

// For every instance, create a map
with (pSave) {
	var _map = ds_map_create();
	
	ds_list_add(_root_list, _map);
	ds_list_mark_as_map(_root_list, ds_list_size(_root_list) - 1);
	
	var _obj = object_get_name(object_index);
	_map[? "obj"] 				= _obj
	_map[? "x"] 				= x;
	_map[? "y"]					= y;
	_map[? "image_blend"]		= image_blend;
	_map[? "image_index"]		= image_index;
	_map[? "image_speed"]		= image_speed;
	_map[? "start_image_speed"] = start_image_speed;
	_map[? "direction"]			= direction;
	_map[? "speed"]				= speed;
	_map[? "bounce_amount"]		= bounce_amount;
	_map[? "bounce_height"]		= bounce_height;
}

// Wrap the root LIST up in a MAP to ensure JSON is HAPPY
var _wrapper = ds_map_create();
ds_map_add_list(_wrapper, "ROOT", _root_list);

var _string = json_encode(_wrapper);
save_string_to_file(_filename, _string);

ds_map_destroy(_wrapper);

show_debug_message("Game Saved");
