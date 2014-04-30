include <common.scad>;
use <models/motor_arm.scad>;
use <parts/body.scad>;
use <parts/u.scad>;
use <parts/side.scad>;
use <parts/leg.scad>;

/**
 * Angles 
 */
angles = [
    [0, -30, 110]
];

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
        u();
        translate([0,UTotalHeight*2,0]) {
            rotate([0,90,180]) {
                u();
                rotate([0,0,alpha]) {
                    motorArm();
                    children();
                }
            }
        }
    }
}

module spideyJoin3(alpha=0) {
    for (side=[MotorWidth/2+Width,-MotorWidth/2]) {
        translate([side,0,0]) {
            rotate([180,90,0]) {
                side();
            }
        }
    }
    translate([0,-2*(SideSize-SideHolesToBorder),0]) {
        rotate([0,0,180]) {
            motorArm();
            rotate([90,90,alpha]) {
                leg();
            }
        }
    }
}

module spideyLeg(a, b, c) {
    spideyJoin1(a) {
        spideyJoin2(b) {
            spideyJoin3(c);
        }
    }
}

module spidey(angles = [0,0,0]) {
    body();
    translate([0,0,MotorDepth+Width]) {
        body();
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
