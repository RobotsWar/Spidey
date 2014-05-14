include <config.scad>;
include <../models/ollo.scad>;
use <../models/motor.scad>;
use <../models/arm.scad>;
use <../parts/u.scad>;
use <../models/motor_arm.scad>;
use <../util/rounded.scad>;
use <../util/thickLine.scad>;

module gecky_tail_body(sizeSide=20, sizeLength=20, angleTail=45, lengthTail=40, widthTail=10, width=2.2) {
	module bodySegment(size) {
		rotate(-90)
		difference() {
			translate([-10,0,0])
				rounded(20, size, width, 5);
			translate([0,size-5,0])
			threeOllo();
		}
	}

	bodySegment(sizeLength);
	rotate(-90)
		bodySegment(sizeSide);
	rotate(90)
		bodySegment(sizeSide);
	translate([-15,-5,0])
		cube([10,10,width]);
	
	thickLine([-10,0], 
		[-10-cos(angleTail)*lengthTail,-sin(angleTail)*lengthTail], widthTail, width);
	thickLine([-10,0], 
		[-10-cos(angleTail)*lengthTail,sin(angleTail)*lengthTail], widthTail, width);
}

module gecky_leg(length=60, height=20, widthSizeBegin=20, widthSizeEnd=15, width=2.2, print=false) {
	size1 = 15;
	module part() {
		difference() {
			translate([-5,0,-height/2])
			union() {
				thickLine([0,widthSizeBegin/2], [size1,widthSizeBegin/2], width, height);
				thickLine([size1-1,widthSizeBegin/2], [length+1,widthSizeEnd/2], width, height);
				thickLine([length,widthSizeEnd/2], [length,0], width, height);
				thickLine([size1,widthSizeBegin/2], [size1,0], width, height);
			}
			translate([0,widthSizeBegin/2+2,0])
				rotate(90, [0,1,0]) rotate(90,[1,0,0])
					threeOllo(10);
			for (x=[-UScrewsSpacing/2,UScrewsSpacing/2]) {
            for (y=[-UScrewsSpacing/2,UScrewsSpacing/2]) {
					translate([length,x,y]) rotate(-90, [0,1,0]) 
               	cylinder(d=UScrewsDiameter, h=10);
        		}
      	}
		}
	}
	
	if (print) {
		translate([-size1,0,height/2]) rotate(90, [1,0,0])
			gecky_leg(length=length, height=height, widthSizeBegin=widthSizeBegin, 
				widthSizeEnd=widthSizeEnd, width=width, print=false);
	} else {
		rotate(90, [1,0,0])
		union() {
			part();
			mirror([0,1,0])
				part();
			translate([length-5,0,0])
				children();
		}
	}
}

module gecky_foot(height=50, width=2.2, depth=4, widthSizeTop=15, widthSizeEnd=5, print=false) {
	if (print) {
		rotate(-90, [0,1,0])
			gecky_foot(height=height, width=width, depth=depth, 
				widthSizeTop=widthSizeTop, widthSizeEnd=widthSizeEnd, print=false);
	} else {
		rotate(180, [1,0,0]) rotate(90, [0,0,1])
		translate([0,0,-UScrewsSpacing])
		difference() {
			union() {
				cylinder(h=height, r=widthSizeTop/2, r2=widthSizeEnd/2);
				translate([0,0,height])
					sphere(widthSizeEnd/2);
				translate([-widthSizeTop/2,-width,0])
					cube([widthSizeTop,width,2*UScrewsSpacing]);
			}
			translate([-50, 0, -5])
				cube(100);
			translate([-50, -100-depth, -5])
				cube(100);
			for (x=[-UScrewsSpacing/2,UScrewsSpacing/2]) {
      		for (y=[-UScrewsSpacing/2,UScrewsSpacing/2]) {
					translate([x,10,y+UScrewsSpacing]) rotate(90, [1,0,0])
         			cylinder(d=UScrewsDiameter, h=20);
         	}
     		}
		}
	}
}

module gecky_head_body(widthSize=5, width=2.2, print=false) {
	module part() {
		difference() {
			translate([0,-MotorWidth/2,0])
				rounded(MotorHeight, MotorWidth, width, 5);
			translate([5,0,0]) rotate(90)
				threeOllo();
			translate([5+3*OlloSpacing,0,0]) rotate(90)
				threeOllo();
		}
	}

	module multipart() {
		part();
		translate([2*MotorHeight,-MotorWidth/2-widthSize/2,0]) rotate(180)
			part();
		translate([2*MotorHeight,MotorWidth/2+widthSize/2,0]) rotate(180)
			part();
		translate([MotorWidth+5,-MotorHeight/2,0])
			rounded(MotorWidth/2, MotorHeight, width, 5);
		translate([MotorHeight/2+15,-1.5*widthSize/2,0])
			cube([MotorHeight, 1.5*widthSize, width]);
	}
	
	if (print) {
		translate([-MotorHeight,0,0])
			multipart();
	} else {
		translate([-5,0,0])
			multipart();
	}


	if (print == false && $children > 0) {
		translate([2*MotorHeight-10,widthSize/2+MotorWidth/2,width]) 
			rotate(90, [0,1,0]) rotate(90, [1,0,0]) 
      		children(0);
   	translate([2*MotorHeight-10,-widthSize/2-MotorWidth/2,width+MotorDepth]) 
			rotate(180, [1,0,0]) rotate(90, [0,1,0]) rotate(90, [1,0,0])
      		children(1);
	}
}

module gecky_head_u(width=2.2, print=false) {
	if (print) {
		u(height=UHeight, radius=URadius, width=width, screws=false, 
			olloScrew=true, widthSize=MotorWidth/2, print=true);
	} else {
		rotate(-90, [1,0,0]) translate([0,-UHeight-URadius,0]) rotate(90, [0,1,0])
		union() {
			difference() {
				u(height=UHeight, radius=URadius, width=width, screws=false, 
					olloScrew=true, widthSize=MotorWidth/2);
			}
			rotate(180, [1,0,0])
				children();
		}
	}
}
