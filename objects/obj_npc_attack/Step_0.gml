// If waiting, do nothing
if (attack_phase == 0) exit;

// Count down the phase timer
phase_timer -= delta_time / 1000000;

if (phase_timer <= 0) {
    if (attack_phase == 1) {
        // Blue phase done, go orange
        targeted_cell.sprite_index = spr_cell_orange;
        attack_phase = 2;
        phase_timer = obj_difficulty.attack_speed / 3;
    } else if (attack_phase == 2) {
        // Orange phase done, go red
        targeted_cell.sprite_index = spr_cell_red;
        attack_phase = 3;
    }
    // Phase 3 (red) just waits for player to move
}