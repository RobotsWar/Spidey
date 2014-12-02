include <config.scad>;
use <../util/screws.scad>;
include <../models/ollo.scad>;
use <../models/motor_arm.scad>;
use <parts.scad>;
use <joints.scad>;

/**
 * Angles 
 */
angles = [0, -30, -110];

module motor_on_body(alpha=0) {
    translate([0, 4*OlloSpacing, MotorDepth/2]) {
        motorArm();
        rotate([0,0,alpha]) {
            children();
        }
    }
}

module spideyLeg(a, b, c) {
	if (MotorsPerLeg == 3) {
    motor_on_body(a) {
        spidey_double_u(b) {
            spidey_side_to_side(c) {
					spidey_arm_leg();
				}
        }
    }	
	}
	if (MotorsPerLeg == 2) {
    motor_on_body(a) {
        spidey_double_u(b) {
				spidey_bottom_leg();
        }
    }	
	}
}

module spidey(angles = [0,0,0]) {
    spidey_body();
    translate([0,0,MotorDepth+Thickness]) {
        spidey_body()
	    screws();
    }

    for (leg=[1:Legs]) {
        rotate([0,0,leg*360/Legs]) {
            translate([0,BodySize-5,Thickness]) {
                spideyLeg(angles[0], angles[1], angles[2]);
            }
        }
    }
}

spidey(angles);
