include <../config.scad>;
use <../parts.scad>;

module spidey_print_leg() {
	xoffset = (MotorsPerLeg == 2) ? 20 : 10;
	translate([0,20,xoffset])
	  rotate([90,0,0])
	    spidey_leg(motorsPerLeg=2);
}

spidey_print_leg();