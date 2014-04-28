// Width of plastic
Width = 2.2;

// Diameter of plastic ollo holes
OlloHoles = 4.3;

// Defining the resolution
$fn=35;

// Do an Ollo hole on the part
module olloHole(depth=Width)
{
    cylinder(depth, OlloHoles/2, OlloHoles/2);
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
    translate([-dx,-dy,0])
    translate([r,r,0])
    minkowski() {
      cube([x-2*r,y-2*r,z/2]);
      cylinder(h=z/2, r=r);
    }
  }
}
