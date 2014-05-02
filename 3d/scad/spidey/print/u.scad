use <../parts.scad>;

module spidey_print_u() {
	translate([0,-10,10])
	  rotate([0,90,0])
	    spidey_u();
}

spidey_print_u();