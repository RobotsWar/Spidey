include <common.scad>;

// Sizes of the part of the leg
LegSizeA = 50;
LegSizeB = 20;
LegSizeC = 22;

// Width of the bottom part of the leg
LegSizeBottom = 8;

// Size of the "top" part of the legs, in mm
LegSizeTop = 22;

module legSide()
{
	difference() {
		translate([0,0,LegSizeA/2])
  		  rotate([0,90,0])
	  	    cube([LegSizeA, 20, Width], center=true);
		translate([-Width, 0, LegSizeA-15]) {
			rotate([90,0,90])
				servoArm(2*Width);
		}
	}
	translate([-Width/2,0,LegSizeA]) {
		rotate([90,0,90])
			linear_extrude(Width)
				polygon([[-10,0],[-1,LegSizeTop],[1,LegSizeTop],[10,0]]);
	}
}

cube([30+Width*2, 20, Width], center=true);

translate([15+Width/2,0,0])
  legSide();
translate([-(15+Width/2),0,0])
  legSide();

translate([0,0,-LegSizeB])
 cube([30+Width*2, 20, Width], center=true);
translate([15+Width/2,0,-LegSizeB/2])
  cube([Width,20,LegSizeB], center=true);
translate([-(15+Width/2),0,-LegSizeB/2])
  cube([Width,20,LegSizeB], center=true);

translate([0,0,-(LegSizeB+LegSizeC)])
 cube([LegSizeBottom+Width*2, 20, Width], center=true);

Dx = (30-LegSizeBottom)/2;
Dy = LegSizeC;
Dl = sqrt(pow(Dx,2)+pow(Dy,2));

module biais() {
translate([-15-Width,-10,-(LegSizeB+Width/2)])
	rotate([0,atan2(Dy,Dx),0])
     cube([Dl,20,Width]);
}
biais();
mirror([1,0,0])
 biais();


