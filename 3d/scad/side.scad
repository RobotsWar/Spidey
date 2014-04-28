include <common.scad>;

SideSize = 38 + 0;

difference() {
  rounded(20, SideSize*2, Width, 5, true);
  for (y=[SideSize-24,	 -SideSize+24,
			 18+SideSize-24, -18-SideSize+24]) {
    translate([0, y, 0])
      threeOllo();
  }
}