/// @description load data

with (game) {	
	if (!file_exists(save_file)) exit;
	
	ds_map_destroy(save_data);
	
	save_data = ds_map_secure_load(save_file);
	
	var _room = save_data[? "Current Room"];
	
	if (!is_undefined(_room) and room_get_name(room) != _room) {
		room_goto(asset_get_index(_room));	
	} else {	
		// NOTE: In GMS2:
		//		* This function will also trigger the Room End event - so would call the save
		//		* Any code which creates instances that is called after this, 
		//			will not create the instance and so should be called before changing room.
		room_restart();
		
		// Since room restart does not fire room start event, perform manually
		// NOTE: Since room start just calls a helper script, could just call that here instead
		//event_perform(ev_other, ev_room_start);
	}
}