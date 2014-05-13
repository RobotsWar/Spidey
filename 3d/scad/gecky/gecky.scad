include <config.scad>;
include <../models/ollo.scad>;
use <../models/motor_arm.scad>;
use <../models/arm.scad>;
use <../joints/double_u.scad>;
use <parts.scad>;
use <joints.scad>;

angles = [0, 0, 0];

module gecky_legfoot() {
	gecky_leg(length=LegLength, height=MotorWidth, width=Width)
		gecky_foot(height=FootHeight, width=Width, widthSizeEnd=FootRadius);
}

module gecky_leg_part() {
	translate([0,TailBodySize+MotorHeight/2,MotorDepth/2+Width]) {
		motorArm();
			double_u(UHeight, URadius, Width, UScrewsSpacing, UScrewsDiameter)
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
				gecky_head_u()
					rotate(90, [0,1,0]) translate([0,-MotorHeight/2-2,-MotorDepth/2-Width])
						gecky_leg_part();
	}
}

module gecky(angles=[0,0,0]) {
	gecky_leg_part();
	rotate(180) 
	gecky_leg_part();
	rotate(-90)
		translate([0,TailBodySize+MotorHeight/2,MotorDepth/2+Width]) {
			motorArm();
			double_u(BodyULength, URadius, Width, UScrewsSpacing, UScrewsDiameter);
		}

	gecky_tail_body(sizeSide=TailBodySize, angleTail=TailAngle, 
		lengthTail=TailLength, widthTail=TailWidth, width=Width);
	translate([0,0,MotorDepth+Width])
		gecky_tail_body(sizeSide=TailBodySize, angleTail=TailAngle, 
			lengthTail=TailLength, widthTail=TailWidth, width=Width);
	
	translate([2*(MotorHeight-MotorArmOffset)+2*BodyULength,0,0])
	union() {
		gecky_head_body(widthSize=HeadBodySize, width=Width) {
			gecky_arm_part(false);
			gecky_arm_part(true);
		}
		translate([0,0,MotorDepth+Width])
			gecky_head_body(widthSize=HeadBodySize, width=Width);
	}
}

gecky(angles);