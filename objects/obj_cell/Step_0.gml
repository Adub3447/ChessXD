if (keyboard_check_pressed(key)) {
    var my_grid = grid_id;
	//show_message("grid_id = " + string(grid_id));
	with (obj_cell) {
        if (grid_id == other.grid_id) {
            highlighted = false;
        }
    }
    highlighted = true;
}