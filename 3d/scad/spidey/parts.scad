include <config.scad>;
use <../parts/body.scad>;
use <../parts/u.scad>;
use <../parts/side.scad>;
use <../parts/leg.scad>;

module spidey_colorize() {
    color(PartsColor)
        children();
}

module spidey_u(print=false) {
    spidey_colorize()
        u(UHeight, URadius, Width, UScrewsSpacing, UScrewsDiameter, print=print);
}

module spidey_leg(print=false) {
    spidey_colorize()
        leg(LegSizeA, LegSizeB, LegSizeC, LegSizeBottom,
                LegSizeTop, (MotorsPerLeg == 2 ? "side" : "arm"), L3Angle, Width, print=print);
}

module spidey_body(print=false) {
    spidey_colorize()
        body(BodySize, Legs, Width, print=print);
}

module spidey_side(print=false) {
    spidey_colorize()
        side(SideSize, SideHolesToBorder, Width, print=print);
}
