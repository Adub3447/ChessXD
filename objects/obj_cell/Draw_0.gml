if (targeted) {
    draw_self();
} else if (highlighted) {
    sprite_index = spr_cell_highlighted;
    draw_self();
} else {
    sprite_index = spr_cell;
    draw_self();
}