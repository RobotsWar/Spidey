use <../models/ollo.scad>;
use <../util/rounded.scad>;

module body(size=20, legs=4, width=2.2) {
    module bodyPart() {
        difference() {
            translate([-10,0,0])
                rounded(20, size, width, 5, center=true);
        }
    }

    module bodyHoles() {
        translate([0, size-5, 0]) {
            threeOllo();
        }
    }

    difference() {
        union() {
            cylinder(d=size*1.8, h=width);
            for (leg=[0:legs]) {
                rotate([0,0,360*leg/legs])
                    bodyPart();
            }
        }
        for (leg=[0:legs]) {
            rotate([0,0,360*leg/legs])
                bodyHoles();
        }
    }			
}

body();
