include <../common.scad>;

LegXOffset = (MotorsPerLeg == 2) ? -10 : 0;
LegWidth = (MotorsPerLeg == 2) ? 24 : 30;

module leg()
{
    module legSide()
    {
        difference() {
            union() {
                translate([0,0,LegSizeA/2])
                    rotate([0,90,0]) {
                        cube([LegSizeA, 20, Width], center=true);
                        if (MotorsPerLeg == 2) {
                            translate([15-LegSizeA/2, 10, -Width/2])
                                rotate([0,0,+L3Angle])
                                rounded(25,10,Width, center=true);
                        }
                    }
            }
            translate([-Width, 0, LegSizeA-15]) {
                rotate([90,0,90]) {
                    if (MotorsPerLeg == 3) {
                        servoArm(2*Width);
                    }
                }
                if (MotorsPerLeg == 2) {
                    translate([0,10,0])
                        rotate([90,90-L3Angle,90])
                        threeOllo(2*Width);
                }
            }
        }
        translate([-Width/2,0,LegSizeA]) {
            rotate([90,0,90])
                linear_extrude(Width)
                polygon([[-10,0],[-1,LegSizeTop],[1,LegSizeTop],[10,0]]);
        }
    }

    module biais() {
        Dx = (LegWidth-LegSizeBottom)/2;
        Dy = LegSizeC;
        Dl = sqrt(pow(Dx,2)+pow(Dy,2));

        translate([-(LegWidth/2)-Width,-10,-(LegSizeB+Width/2)])
            rotate([0,atan2(Dy,Dx),0])
            cube([Dl,20,Width]);
    }

    color(PartsColor) {
        translate([0,LegXOffset,-LegSizeA+15]) {
            cube([LegWidth+Width*2, 20, Width], center=true);

            translate([LegWidth/2+Width/2,0,0])
                legSide();
            translate([-(LegWidth/2+Width/2),0,0])
                legSide();

            translate([0,0,-LegSizeB])
                cube([LegWidth+Width*2, 20, Width], center=true);
            translate([LegWidth/2+Width/2,0,-LegSizeB/2])
                cube([Width,20,LegSizeB], center=true);
            translate([-(LegWidth/2+Width/2),0,-LegSizeB/2])
                cube([Width,20,LegSizeB], center=true);

            translate([0,0,-(LegSizeB+LegSizeC)])
                cube([LegSizeBottom+Width*2, 20, Width], center=true);

            biais();
            mirror([1,0,0]) {
                biais();
            }
        }
    }
}

leg();
