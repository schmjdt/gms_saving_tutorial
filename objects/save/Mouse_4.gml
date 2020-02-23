/// @description save data

with (game) {
	// Force an event to run
	// NOTE: Since room end just calls a helper script, could just call that here instead
	//event_perform(ev_other, ev_room_end);
	save_coin_data_using_ds_grid();
	
	ds_map_secure_save(save_data, save_file);	
}