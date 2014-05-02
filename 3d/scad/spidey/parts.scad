include <config.scad>;
use <../parts/body.scad>;
use <../parts/u.scad>;
use <../parts/side.scad>;
use <../parts/leg.scad>;

module spidey_colorize() {
	color(PartsColor)
	children();
}

module spidey_u() {
	spidey_colorize()
    u(UHeight, URadius, Width, UScrewsSpacing, UScrewsDiameter);
}

module spidey_leg() {
	spidey_colorize()
	leg(LegSizeA, LegSizeB, LegSizeC, LegSizeBottom,
		 LegSizeTop, MotorsPerLeg, L3Angle, Width);
}

module spidey_body() {
	spidey_colorize()
	body(BodySize, Legs, Width);
}

module spidey_side() {
	spidey_colorize()
	side(SideSize, SideHolesToBorder, Width);
}