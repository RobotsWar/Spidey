module screws(count=4, radius=6, size=3.3, thickness=2.2)
{
	for (screw=[1:count]) {
		rotate([0,0,screw*360/count])
		translate([radius,0,-1])
		cylinder(d=size, h=thickness+2);
	}
}

screws();