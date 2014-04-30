include <../common.scad>;

module body() {
    module bodyPart() {
        difference() {
            translate([-10,0,0])
                rounded(20, BodySize, Width, 5, center);
        }
    }

    module bodyHoles() {
        translate([0, BodySize-5, 0]) {
            threeOllo();
        }
    }

    color(PartsColor) {
        difference() {
            union() {
                cylinder(d=BodySize*1.8, h=Width);
                for (leg=[0:Legs]) {
                    rotate([0,0,360*leg/Legs])
                        bodyPart();
                }
            }
            for (leg=[0:Legs]) {
                rotate([0,0,360*leg/Legs])
                    bodyHoles();
            }
        }			
    }
}

body();
