if (keyboard_check_pressed(key)) {
    var my_grid = grid_id;
    with (obj_cell) {
        if (grid_id == my_grid && !targeted) {
            has_player = false;
        }
    }
	if (grid_id ==0)
	{
		has_player = true;
		obj_player_token.x = x+64;
		obj_player_token.y = y +64;
		obj_player_token.current_cell = id;
	}
	
    // If this is a defend grid cell, trigger NPC attack
    if (grid_id == 1) {
        var defend_cells = ds_list_create();
        with (obj_cell) {
            if (grid_id == 0) {				//redundant check?
                ds_list_add(defend_cells, id);
            }
        }
        var random_index = irandom(ds_list_size(defend_cells) - 1);
		var target = defend_cells[| random_index];
        ds_list_destroy(defend_cells);
        
        // Spawn a new attack cycle and hand it the target
	    var cycle = instance_create_layer(0, 0, "Instances", obj_attack_cycle);
	    cycle.targeted_cell = target;
	    cycle.targeted_cell.targeted = true;
	    cycle.targeted_cell.sprite_index = spr_cell_blue;
	    cycle.attack_phase = 1;
	    cycle.phase_timer = obj_difficulty.attack_speed / 3;
    }
}