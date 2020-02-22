/// @description 

if (state == Trans_State.out || state == Trans_State.in) {
	draw_rectangle(
		transition_x, transition_y,
		transition_x + room_width,
		transition_y + room_height,
		false
	);
}