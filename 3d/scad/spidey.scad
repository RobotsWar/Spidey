include <common.scad>;
use <models/motor_arm.scad>;
use <body.scad>;
use <u.scad>;
use <side.scad>;
use <leg.scad>;

angles = [
	[0, -30, 110],
	[0, -30, 110],
	[0, -30, 110],
	[0, -30, 110]
];

module firstArticulation(alpha=0) {
    translate([0,24,MotorDepth/2]) {
        motorArm();
        rotate([0,0,alpha]) {
            children();
        }
    }
}

module secondArticulation(alpha=0) {
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

module thirdArticluation(alpha=0) {
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

module assemblyLeg(a, b, c) {
    firstArticulation(a) {
        secondArticulation(b) {
            thirdArticluation(c);
        }
    }
}

module spidey(angles) {
body();
translate([0,0,MotorDepth+Width]) {
    body();
}

for (i=[0:3]) {
    rotate([0,0,i*90]) {
        translate([0,BodySize-5,Width]) {
            assemblyLeg(angles[i][0], angles[i][1], angles[i][2]);
        }
    }
}
}

spidey(angles);
