include <config.scad>;
include <../models/ollo.scad>;
use <../models/motor_arm.scad>;
use <../models/arm.scad>;
use <../joints/double_u.scad>;
use <parts.scad>;

module gecky_legfoot() {
	gecky_leg()
		gecky_foot();
}

module gecky_leg_part() {
	translate([0,TailBodySizeSide+MotorHeight/2,MotorDepth/2+Width]) {
		motorArm();
			gecky_double_u()
				translate([0,-MotorHeight+MotorArmOffset+OlloWidth,0])
					rotate(-90, [0,0,1])	
						gecky_legfoot();
	}
}

module gecky_arm_part(right=true) {
	theta = right ? 180 : 0;
	translate([-MotorDepth/2,0,0]) {
		motorArm();
		rotate(theta, [0,0,1]) translate([0,0,-MotorDepth/2-OlloWidth]) 
			rotate(90, [0,0,1]) rotate(180, [1,0,0])
				gecky_u()
					rotate(90, [0,1,0]) translate([0,-MotorHeight/2-2,-MotorDepth/2-Width])
						gecky_leg_part();
	}
}

module gecky() {
	gecky_leg_part();
	rotate(180) 
	gecky_leg_part();
	rotate(-90)
		translate([0,TailBodySizeLength+MotorHeight/2+1,MotorDepth/2+Width]) {
			motorArm();
			gecky_double_u();
		}

	gecky_tail_body();
	translate([0,0,MotorDepth+Width])
		gecky_tail_body();
	
	translate([TailBodySizeLength+MotorHeight-2*MotorArmOffset+2*UHeight+2*URadius+1,0,0])
	union() {
		gecky_head_body() {
			gecky_arm_part(false);
			gecky_arm_part(true);
		}
		translate([0,0,MotorDepth+Width])
			gecky_head_body();
	}
}

gecky();