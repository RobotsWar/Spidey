include <config.scad>;
use <../joints/double_u.scad>;
use <../joints/side_to_side.scad>;
use <../joints/leg.scad>;

module spidey_double_u(alpha=0) {
    double_u(UHeight, URadius, Thickness, UScrewsSpacing, UScrewsDiameter, col=PartsColor, alpha=alpha) {
        children();
    }
}

module spidey_side_to_side(alpha=0) {
    side_to_side(SideSize, SideHolesToBorder, Thickness, col=PartsColor, alpha=alpha) {
        children();
    }
}


module spidey_arm_leg() {
    color(PartsColor) {
        arm_leg(LegSizeA, LegSizeB, LegSizeC, LegSizeBottom,
                LegSizeTop, (MotorsPerLeg == 2 ? "side" : "arm"), L3Angle, Thickness, print=print);
    }
}

module spidey_bottom_leg() {
    color(PartsColor) {
        bottom_leg(LegSizeA, LegSizeB, LegSizeC, LegSizeBottom,
                LegSizeTop, (MotorsPerLeg == 2 ? "side" : "arm"), L3Angle, Thickness, print=print);
    }
}
