include <../common.scad>;

module u() {
    module Ubranch() {
        union() {  
            cylinder(Width, 10, 10);
            translate([-10,0,0])
                cube([20, UHeight, Width]);
        }
    }

    module USide() {
        difference() {
            union() {
                Ubranch();
                translate([-10,UHeight+URadius-Width,URadius])
                    cube([20,Width,15-(URadius-Width)]);
                translate([-10,UHeight,URadius]) {
                    rotate([0,90,0]) {
                        difference() {
                            cylinder(20,URadius,URadius);
                            translate([0,0,-1])
                                cylinder(22,URadius-Width,URadius-Width);
                            translate([-10+URadius-Width,-10,-1])
                                cube([10,10,22]);
                            translate([-10,-20+URadius-Width,-1])
                                cube([10,20.01,22]);
                        }
                    }
                }
            }
            servoArm(depth=6);
        }
    }

	 module UScrews() {
		for (x=[-UScrewsSpacing/2,UScrewsSpacing/2]) {
			for (y=[-UScrewsSpacing/2,UScrewsSpacing/2]) {
			  rotate([270,0,0])
			  translate([x,y,0])
			  cylinder(d=UScrewsDiameter, h=100);
			}
      }
	 }

    color(PartsColor) {
		  difference() {
          translate([0,0,-15-Width]) {
            USide();
            mirror([0,0,1]) translate([0,0,-2*Width-30])  
                USide();
          }
			 UScrews();
		  }
    }
}

u();
