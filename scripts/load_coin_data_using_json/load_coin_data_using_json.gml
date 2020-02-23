/// @desc load_coin_data_using_json
/// @arg filename

var _filename = argument[0];

with (pSave) instance_destroy();

if (!file_exists(json.filename_coin_save)) exit;
	
var _string = load_string_from_file(_filename);

var _wrapper = json_decode(_string);

var _list = _wrapper[? "ROOT"];

var yy = 0;
repeat (ds_list_size(_list)) {
	var _map = _list[| yy];
		
	var _obj = _map[? "obj"]
	
	var _inst = instance_create_layer(0, 0, "Instances", asset_get_index(_obj))
	
	with (_inst) {
		x					= _map[? "x"];
		y					= _map[? "y"];
		image_blend 		= _map[? "image_blend"];
		image_index 		= _map[? "image_index"];
		image_speed			= _map[? "image_speed"];
		start_image_speed	= _map[? "start_image_speed"];
		direction			= _map[? "direction"];
		speed				= _map[? "speed"];
		bounce_amount		= _map[? "bounce_amount"];
		bounce_height		= _map[? "bounce_height"];
	}
	
	yy += 1;
}

ds_map_destroy(_wrapper);

show_debug_message("Game Loaded");
