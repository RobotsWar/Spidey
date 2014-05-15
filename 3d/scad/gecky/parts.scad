include <config.scad>;
include <../models/ollo.scad>;
use <models.scad>;
use <../joints/double_u.scad>;
use <../parts/u.scad>;

module gecky_tail_body(print=false) {
	gecky_model_tail_body(sizeSide=TailBodySizeSide, sizeLength=TailBodySizeLength, 
		angleTail=TailAngle, lengthTail=TailLength, widthTail=TailWidth, width=Width, print=print);
}

module gecky_leg(print=false) {
	gecky_model_leg(length=LegLength, height=MotorWidth, width=Width, print=print)
		children();
}

module gecky_foot(print=false) {
	gecky_model_foot(height=FootHeight, width=Width, widthSizeEnd=FootRadius, print=print);
}

module gecky_head_body(print=false) {
	if ($children > 0) {
		gecky_model_head_body(widthSize=HeadBodySize, width=Width, print=print) {
			children(0);
			children(1);
		}
	} else {
		gecky_model_head_body(widthSize=HeadBodySize, width=Width, print=print);
	}
}

module gecky_u(print=false) {
	gecky_model_head_u(width=Width, print=print)
		children();
}

module gecky_double_u(print=false, noMotor=false) {
	if (print) {
		u(UHeight, URadius, Width, UScrewsSpacing, UScrewsDiameter, print=print);
	} else if (noMotor) {
		u(UHeight, URadius, Width, UScrewsSpacing, UScrewsDiameter);
			translate([0,2*(UHeight+URadius),0]) rotate(180, [1,0,0]) rotate(90, [0,1,0]) {
				u(UHeight, URadius, Width, UScrewsSpacing, UScrewsDiameter);
				rotate(180, [0,1,0])
					children();
			}
	} else {
		double_u(UHeight, URadius, Width, UScrewsSpacing, UScrewsDiameter, print=print)
			children();
	}
}
