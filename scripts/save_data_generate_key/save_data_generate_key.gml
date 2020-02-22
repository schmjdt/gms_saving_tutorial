/// @desc save_data_generate_key

// Creates a key for the current item to use for save data.
//		example: rm_middleobj_chest300300
return room_get_name(room) + object_get_name(object_index) + string(x) + string(y);