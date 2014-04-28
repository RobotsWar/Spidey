include <common.scad>;

module side() {
    translate([0,SideSize-SideHolesToBorder,0]) {
        color(PartsColor) {
            difference() {
                rounded(20, SideSize*2, Width, 5, true);
                for (y=[SideSize-SideHolesToBorder,	 -SideSize+SideHolesToBorder,
                        SideSize-SideHolesToBorder-18, -SideSize+SideHolesToBorder+18]) {
                    translate([0, y, 0])
                        threeOllo();
                }
            }
        }
    }
}

side();
