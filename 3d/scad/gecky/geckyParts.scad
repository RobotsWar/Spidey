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

module gecky_part1() {
	gecky_tail_body();
	translate([0,0,MotorDepth+Width])
		gecky_tail_body();
	translate([0,TailBodySizeSide+MotorHeight/2,MotorDepth/2+Width])
		motorArm();
	mirror([0,1,0])
		translate([0,TailBodySizeSide+MotorHeight/2,MotorDepth/2+Width])
			motorArm();
	rotate(-90)
		translate([0,TailBodySizeLength+MotorHeight/2+1,MotorDepth/2+Width])
			motorArm();
}
module gecky_part2() {
	translate([0,TailBodySizeSide+MotorHeight/2,MotorDepth/2+Width])
		gecky_double_u(noMotor=true);
}
module gecky_part3() {
	mirror([0,1,0])
		gecky_part2();
}
module gecky_part4() {
	translate([0,TailBodySizeSide+MotorHeight/2,MotorDepth/2+Width]) {
		translate([0,2*(UHeight+URadius),0]) rotate(180, [0,0,1]) rotate(90, [0,1,0]) {
			motorArm();
			translate([0,-MotorHeight+MotorArmOffset+OlloWidth,0])
				rotate(-90, [0,0,1])	
					gecky_legfoot();
		}
	}
}
module gecky_part5() {
	mirror([0,1,0])
		gecky_part4();
}
module gecky_part6() {
	rotate(-90)
		translate([0,TailBodySizeLength+MotorHeight/2+1,MotorDepth/2+Width])
			gecky_double_u(noMotor=true);
}
module gecky_part7() {
	translate([TailBodySizeLength+MotorHeight-2*MotorArmOffset+2*UHeight+2*URadius+1,0,0]) {
		gecky_head_body();
		translate([0,0,MotorDepth+Width])
			gecky_head_body();
		translate([0,0,MotorDepth/2+Width]) rotate(90, [0,0,1]) rotate(90, [0,1,0])
			motorArm();
		translate([2*MotorHeight-10,HeadBodySize/2+MotorWidth/2,MotorDepth/2+Width])
			rotate(-90, [0,0,1]) rotate(90, [0,1,0])
				motorArm();
		translate([2*MotorHeight-10,-HeadBodySize/2-MotorWidth/2,MotorDepth/2+Width])
			rotate(-90, [0,0,1]) rotate(90, [0,1,0])
				motorArm();
	}
}
module gecky_part8() {	
	translate([TailBodySizeLength+MotorHeight-2*MotorArmOffset+2*UHeight+2*URadius+1,0,0])
		translate([2*MotorHeight-10,-HeadBodySize/2-MotorWidth/2,MotorDepth/2+Width])
			translate([0,-MotorWidth/2-3,0]) { 
				rotate(90, [0,1,0]) rotate(-90, [0,0,1]) rotate(90, [0,1,0])
					gecky_u();
				translate([0,-UHeight-URadius-MotorHeight+MotorArmOffset+9,0]) rotate(180, [0,0,1])
					motorArm();
			}
}
module gecky_part9() {
	mirror([0,1,0])
		gecky_part8();
}
module gecky_part10() {
	translate([TailBodySizeLength+MotorHeight-2*MotorArmOffset+2*UHeight+2*URadius+1,0,0])
		translate([2*MotorHeight-10,-HeadBodySize/2-MotorWidth/2,MotorDepth/2+Width])
			translate([0,-MotorWidth/2-3,0]) 
				translate([0,-3*(UHeight+URadius)-MotorHeight+MotorArmOffset+9,0]) rotate(90, [0,1,0])
					gecky_double_u(noMotor=true);
}
module gecky_part11() {
	mirror([0,1,0])
		gecky_part10();
}
module gecky_part12() {
	translate([TailBodySizeLength+MotorHeight-2*MotorArmOffset+2*UHeight+2*URadius+1,0,0])
		translate([2*MotorHeight-10,-HeadBodySize/2-MotorWidth/2,MotorDepth/2+Width])
			translate([0,-MotorWidth/2-3,0]) 
				translate([0,-3*(UHeight+URadius)-MotorHeight+MotorArmOffset+9,0]) rotate(90, [0,1,0]) {
					motorArm();
					translate([0,-MotorHeight+MotorArmOffset+OlloWidth,0])
						rotate(-90, [0,0,1])	
							gecky_legfoot();
				}
}
module gecky_part13() {
	mirror([0,1,0])
		gecky_part12();
}

gecky_part1();
gecky_part2();
gecky_part3();
gecky_part4();
gecky_part5();
gecky_part6();
gecky_part7();
gecky_part8();
gecky_part9();
gecky_part10();
gecky_part11();
gecky_part12();
gecky_part13();

