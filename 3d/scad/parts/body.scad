include <../common.scad>;

module body() {
    module bodyPart() {
        difference() {
            rounded(20, BodySize*2, Width, 5, center=true);
            for (y=[BodySize-5, -BodySize+5]) {
                translate([0, y, 0]) {
                    threeOllo();
                }
            }
        }
    }

    color(PartsColor) {
        bodyPart();
        rotate([0,0,90]) {
            bodyPart();
        }
    }
}

body();
