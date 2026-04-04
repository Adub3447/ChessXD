
## Overview
2 grids of 9 cells
- Defend
- Attack

Press RH keys to attack opponents grid.
Press LH keys to dodge.

## Roadmap
v.1 - Initial Development
v.2 - Game mechanics and basic functionality (pawns only)
v.5 - Menu and Functional build (pawns only)


## Instanced Objects
### [obj_cell]

- Create Code:
	- sets default values for:
		- keybind
		- player position
		- grid faction
		- attack status
- Step Code:
	- entire step code is in an IF statement to check if a key is pressed
		- This check for key pressed also passes an argument for which key is pressed
	- stores which grid id that key belongs to (attack vs defend)
	- a loop to check every grid cell:
		- IF NOT attacked AND NOT targeted   ```has_player=false;```
		- clears cell to default color
	- 2 IF statements to check which grid the pressed key belongs to. 
		- pressed key is in Defend Grid
			- set player for keycell to true
			- set player object (w/ sprite) to the keycell
			- provide player object with current cell (keycell)
		- pressed key is in Attack Grid
			- create a list of cells from the defense grid for the npc to attack
			- picks a random index from this list to attack [need to update w/ logic]
			- stores targeted cell into a variable and destroys the list (saves memory)
		- Attack Cycle
			- is inside Attack grid IF statement
			- spawns an [attack cycle object] called ```cycle``` to perform functions
				- Variables used from [obj_attack_cycle create]:
				- targeted_cell -  provided the target cell
				- targeted (from [obj_cell]) - gets set to true for that cell
				- attack_phase - triggers the attack color sequence
				- phase_timer - sets the timer using attack_speed from [obj_difficulty] manager



- obj_grid
- obj_player_token