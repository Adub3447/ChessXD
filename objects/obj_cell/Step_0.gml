if (keyboard_check_pressed(key)) {
    var my_grid = grid_id;
    with (obj_cell) {
        if (grid_id == my_grid && !targeted) {
            highlighted = false;
            sprite_index = spr_cell;
        }
    }
    highlighted = true;
    sprite_index = spr_cell_highlighted;
    
    // If this is a defend grid cell, trigger NPC attack
    if (grid_id == 1) {
        /* Reset previous targeted cell
        if (obj_npc_attack.targeted_cell != noone) {
            obj_npc_attack.targeted_cell.targeted = false;
            obj_npc_attack.targeted_cell.sprite_index = spr_cell;
        }
        obj_npc_attack.attack_phase = 0;
        obj_npc_attack.targeted_cell = noone;
        */
        // Pick a random defend cell to target
        var defend_cells = ds_list_create();
        with (obj_cell) {
            if (grid_id == 0) {
                ds_list_add(defend_cells, id);
            }
        }
        var random_index = irandom(ds_list_size(defend_cells) - 1);
        obj_npc_attack.targeted_cell = defend_cells[| random_index];
        ds_list_destroy(defend_cells);
        
        // Start blue phase
        obj_npc_attack.targeted_cell.targeted = true;
        obj_npc_attack.targeted_cell.sprite_index = spr_cell_blue;
        obj_npc_attack.attack_phase = 1;
        obj_npc_attack.phase_timer = obj_difficulty.attack_speed / 3;
    }
}