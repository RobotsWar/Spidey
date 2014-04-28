include <common.scad>;

BodySize = 18 + 0;

module bodyPart() {
	difference() {
		rounded(20, BodySize*2, Width, 5, center=true);
		for (y=[BodySize-5, -BodySize+5]) {
			translate([0, y, 0])
				threeOllo();
		}
	}
}

bodyPart();
rotate([0,0,90])
	bodyPart();