include <../config.scad>;
use <../parts.scad>;

module spidey_print_side() {
	translate([0,-SideSize+SideHolesToBorder,0])
	spidey_side();
}

spidey_print_side();