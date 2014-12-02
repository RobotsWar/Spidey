include <config.scad>;
use <../util/screws.scad>;
use <../parts/body.scad>;
use <../parts/u.scad>;
use <../parts/side.scad>;
use <../parts/leg.scad>;
use <../parts/batfix.scad>;

module spidey_colorize() {
    color(PartsColor)
        children();
}

module spidey_u(print=false) {
    spidey_colorize()
        u(UHeight, URadius, Thickness, UScrewsSpacing, UScrewsDiameter, print=print);
}

module spidey_leg(print=false) {
    spidey_colorize()
        leg(LegSizeA, LegSizeB, LegSizeC, LegSizeBottom,
                LegSizeTop, (MotorsPerLeg == 2 ? "side" : "arm"), L3Angle, Thickness, print=print);
}

module spidey_body_screws() {
	squareScrews(BodyScrewsW, BodyScrewsH, BodyScrewsSize, Thickness);
}

module spidey_body(print=false, top=false) {
    spidey_colorize()
        body(BodySize, Legs, Thickness, print=print)
		if (top && BodyScrews) {
			spidey_body_screws();
		}
}

module spidey_side(print=false) {
    spidey_colorize()
        side(SideSize, SideHolesToBorder, Thickness, print=print);
}

module spidey_batfix(print=false) {
	spidey_colorize()
    	batfix(print=print)
        	spidey_body_screws();
}
