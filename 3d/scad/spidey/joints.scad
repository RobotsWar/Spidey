include <config.scad>;
use <../joints/double_u.scad>;
use <../joints/side_to_side.scad>;
use <parts.scad>;

module spidey_double_u(alpha=0) {
    double_u(UHeight, URadius, Width, UScrewsSpacing, UScrewsDiameter, col=PartsColor, alpha=alpha)
    children();
}

module spidey_side_to_side(alpha=0) {
    side_to_side(SideSize, SideHolesToBorder, Width, col=PartsColor, alpha=alpha)
    children();
}


module arm_leg() {
    rotate([90,90,0]) {
        spidey_leg();
    }
}

module bottom_leg() {
    translate([0,-(24),0]) {
        rotate([180,0,0]) {
            rotate([180,90,L3Angle]) {
                spidey_leg();
            }
        }
    }
}
