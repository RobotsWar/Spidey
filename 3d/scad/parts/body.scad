include <../common.scad>;

module body() {
    module bodyPart() {
        difference() {
			   translate([-10,0,0])
              rounded(20, BodySize, Width, 5, center);
             translate([0, BodySize-5, 0]) {
                 threeOllo();
             }
        }
    }

    color(PartsColor) {
 	     cylinder(d=BodySize, h=Width);
		  for (leg=[0:Legs]) {
			  rotate([0,0,360*leg/Legs])
           bodyPart();
		  }
    }
}

body();
