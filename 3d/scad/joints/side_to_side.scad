include <../models/motor.scad>;
use <../models/motor_arm.scad>;
use <../parts/side.scad>;

module side_to_side(size=40, holesToBorder=5, col="white", width=2.2)
{
    for (side=[MotorWidth/2+width,-MotorWidth/2]) {
        translate([side,0,0]) {
            rotate([180,90,0]) {
                color(col)
                    side(size, holesToBorder, width);
            }
        }
    }
    translate([0,-2*(size+holesToBorder),0]) {
        rotate([0,0,180]) {
            motorArm();
            rotate([0,0,alpha])
                children();
        }
    }
}

side_to_side();
