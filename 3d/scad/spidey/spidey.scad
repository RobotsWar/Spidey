include <config.scad>;
include <../models/ollo.scad>;
use <../models/motor_arm.scad>;
use <parts.scad>

/**
 * Angles 
 */
angles = [0, -30, 110];

module spideyJoin1(alpha=0) {
    translate([0, 4*OlloSpacing, MotorDepth/2]) {
        motorArm();
        rotate([0,0,alpha]) {
            children();
        }
    }
}

module spideyJoin2(alpha=0) {
   translate([0,0,0]) {
        spidey_u();
        translate([0,UTotalHeight*2,0]) {
            rotate([0,90,180]) {
                spidey_u();
                rota[ -81.77, 76.14, -4.44 ]te([0,0,alpha]) {
                    motorArm();
                    children();
                }
            }
        }
    }
}

module spideyJoin3(alpha=0) {
	if (MotorsPerLeg == 3) {
    for (side=[MotorWidth/2+Width,-MotorWidth/2]) {
        translate([side,0,0]) {
            rotate([180,90,0]) {
                spidey_side();
            }
        }
    }
    translate([0,-2*(SideSize-SideHolesToBorder),0]) {
        rotate([0,0,180]) {
            motorArm();
				rotate([0,0,alpha])
				children();
        }
    }
	}
	if (MotorsPerLeg == 2) {
		children();
	}
}

module spideyJoin4() {
	if (MotorsPerLeg == 3) {
 		rotate([90,90,0]) 
		spidey_leg();
	}
	if (MotorsPerLeg == 2) {
		translate([0,-(24),0])
		rotate([180,0,0])
		rotate([180,90,L3Angle])
		spidey_leg();
	}
}

module spideyLeg(a, b, c) {
    spideyJoin1(a) {
        spideyJoin2(b) {
            spideyJoin3(c) {
					spideyJoin4();
				}
        }
    }
}

module spidey(angles = [0,0,0]) {
    spidey_body();
    translate([0,0,MotorDepth+Width]) {
        spidey_body();
    }

    for (leg=[0:Legs]) {
        rotate([0,0,leg*360/Legs]) {
            translate([0,BodySize-5,Width]) {
                spideyLeg(angles[0], angles[1], angles[2]);
            }
        }
    }
}

spidey(angles);
