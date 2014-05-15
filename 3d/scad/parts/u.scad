use <../models/ollo.scad>;

module u(height=15, radius=8, width=2.2, screwsSpacing=10, screwsDiameter=2.6, screws=true, olloScrew=false, widthSize=15, print=false) {
    module Ubranch() {
        union() {  
            cylinder(width, 10, 10);
            translate([-10,0,0])
                cube([20, height, width]);
        }
    }

    module USide() {
        difference() {
            union() {
                Ubranch();
                translate([-10,height+radius-width,radius])
                    cube([20,width,widthSize-(radius-width)]);
                translate([-10,height,radius]) {
                    rotate([0,90,0]) {
                        difference() {
                            cylinder(20,radius,radius);
                            translate([0,0,-1])
                                cylinder(22,radius-width,radius-width);
                            translate([-10+radius-width,-10,-1])
                                cube([10,10,22]);
                            translate([-10,-20+radius-width,-1])
                                cube([10,20.01,22]);
                        }
                    }
                }
            }
            servoArm(depth=6);
        }
    }

    module UScrews() {
        for (x=[-screwsSpacing/2,screwsSpacing/2]) {
            for (y=[-screwsSpacing/2,screwsSpacing/2]) {
                rotate([270,0,0])
                    translate([x,y,0])
                    cylinder(d=screwsDiameter, h=100);
            }
        }
    }

	module UOllo() {
		rotate(-90, [1,0,0])
			servoArm(2*height);
	}

    if (print) {
        translate([0,0,10])
            rotate([0,90,0])
            u(height,radius,width,screwsSpacing,screwsDiameter,
                screws,olloScrew,widthSize,false);
    } else {
        echo("[PART] u");
        difference() {
            translate([0,0,-widthSize-width]) {
                USide();
                mirror([0,0,1]) translate([0,0,-2*width-2*widthSize])  
                    USide();
            }
            if (screws) {
                UScrews();
            }
            if (olloScrew) {
                UOllo();
            }
        }
    }
}

u();
