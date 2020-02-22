/// @desc save_data_set_value
/// @arg key
/// @arg value

with (game) {
	ds_map_replace(save_data, argument[0], argument[1]); 
}
