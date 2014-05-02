include <../models/ollo.scad>;
use <../util/rounded.scad>;

module side(size=40, holesToBorder=5, width=2.2) {
    translate([0,size-holesToBorder,0]) {
        difference() {
            rounded(20, size*2, width, 5, true);
            for (y=[size-holesToBorder,	 -size+holesToBorder,
                    size-holesToBorder-3*OlloSpacing, -size+holesToBorder+3*OlloSpacing]) {
                translate([0, y, 0])
                    threeOllo();
            }
        }
    }
}

side();
