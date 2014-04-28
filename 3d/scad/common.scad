// Width of plastic
Width = 2.2;

// Color of the parts
PartsColor = [0.8, 0.8, 0.8];

// Diameter of plastic ollo holes
OlloHoles = 4.3;

// Width of Ollo "real" plastic
OlloWidth = 3;

// Motor dimensions
MotorWidth = 24;
MotorHeight = 36;
MotorDepth = 24;
MotorArmOffset = 9;

// U dimensions
UHeight = 10;
URadius = 8;
UWidth = 30+Width/2;
UTotalHeight = UHeight+URadius;

// Side dimensions
SideSize = 38 + 0;
SideHolesToBorder = 5;

// Size of the body
BodySize = 18;

// Defining the resolution
$fn=35;

// Do an Ollo hole on the part
module olloHole(depth=Width)
{
    translate([0,0,-0.1])
      cylinder(depth+0.2, OlloHoles/2, OlloHoles/2);
}

// Do 3 ollo holes
module threeOllo(depth=Width)
{
  for (xy=[[-6,0],[0,0],[6,0]]) {
    translate([xy[0], xy[1], 0])
    olloHole(depth);
  }
}

// Do a servo arm holes
module servoArm(depth=Width)
{
    threeOllo(depth);
    rotate([0,0,90])
      threeOllo(depth);
}

// Do a rounded cube
module rounded(x=10, y=10, z=10, r=3, center=false) {
  if (center) {
    translate([-(x/2),-(y/2),0])
      rounded(x, y, z, r);
  } else {
    translate([r,r,0])
    minkowski() {
      cube([x-2*r,y-2*r,z/2]);
      cylinder(h=z/2, r=r);
    }
  }
}
