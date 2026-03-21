var binds = obj_gridbinds;
var cell_size = 128;

var gap = 140;
var total_width = 384 + gap + 384;

var left_x = (1200 - total_width) / 2;
var right_x = left_x + 384 + gap;
var grid_y = (800-384) /2;

//Defense Grid
for (var i = 0; i < 9; i++)
{
	var col = i mod 3;
	var row = i div 3;
	var cell = instance_create_layer(left_x + col*cell_size, grid_y + row*cell_size, "Instances", obj_cell);
	cell.key = binds.defend_keys[i];
}

//Attack Grid
for (var i = 0; i < 9; i++)
{
	var col = i mod 3;
	var row = i div 3;
	var cell = instance_create_layer(right_x + col*cell_size, grid_y + row*cell_size, "Instances", obj_cell);
	cell.key = binds.attack_keys[i];
}