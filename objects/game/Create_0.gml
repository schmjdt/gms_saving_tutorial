/// @description 

#region Save Data

save_data = ds_map_create();
// File path to save data
save_file = "SaveData.sav";

save_data_set_value("Current Room", room_get_name(room));

#endregion

#region Transition Stuff

depth = -1;

enum Trans_Dir {
	left,
	right,
	up,
	down
};

enum Trans_State{
	none,
	out,
	in
}

state = Trans_State.none;
trans_dir = Trans_Dir.up;

timer = 0;
target_room = noone;
transition_length = room_speed / 4;
transition_x = 0;
transition_y = 0;

#endregion