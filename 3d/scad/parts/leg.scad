use <../models/ollo.scad>;
use <../util/rounded.scad>;

module leg(sizeA=60, sizeB=20, sizeC=20, sizeBottom=10,
        sizeTop=15, motorsPerLeg=3, fixationAngle=0, width=2.2, print=false)
{
    xOffset = (motorsPerLeg == 2) ? -10 : 0;
    spacing = (motorsPerLeg == 2) ? 24 : 30;

    module legSide()
    {
        difference() {
            union() {
                translate([0,0,sizeA/2])
                    rotate([0,90,0]) {
                        cube([sizeA, 20, width], center=true);
                        if (motorsPerLeg == 2) {
                            translate([15-sizeA/2, 10, -width/2])
                                rotate([0,0,+fixationAngle])
                                rounded(25,10,width, center=true);
                        }
                    }
            }
            translate([-width, 0, sizeA-15]) {
                rotate([90,0,90]) {
                    if (motorsPerLeg == 3) {
                        servoArm(2*width);
                    }
                }
                if (motorsPerLeg == 2) {
                    translate([0,10,0])
                        rotate([90,90-fixationAngle,90])
                        threeOllo(2*width);
                }
            }
        }
        translate([-width/2,0,sizeA]) {
            rotate([90,0,90])
                linear_extrude(width)
                polygon([[-10,0],[-1,sizeTop],[1,sizeTop],[10,0]]);
        }
    }

    module biais() {
        Dx = (spacing-sizeBottom)/2;
        Dy = sizeC;
        Dl = sqrt(pow(Dx,2)+pow(Dy,2));

        translate([-(spacing/2)-width,-10,-(sizeB+width/2)])
            rotate([0,atan2(Dy,Dx),0])
            cube([Dl,20,width]);
    }

    if (print) {
        translate([0,0,10-xOffset])
            rotate([90,0,0])
            leg(sizeA, sizeB, sizeC, sizeBottom,
                    sizeTop, motorsPerLeg, fixationAngle, width, false);
    } else {
        translate([0,xOffset,-sizeA+15]) {
            cube([spacing+width*2, 20, width], center=true);

            translate([spacing/2+width/2,0,0])
                legSide();
            translate([-(spacing/2+width/2),0,0])
                legSide();

            translate([0,0,-sizeB])
                cube([spacing+width*2, 20, width], center=true);
            translate([spacing/2+width/2,0,-sizeB/2])
                cube([width,20,sizeB], center=true);
            translate([-(spacing/2+width/2),0,-sizeB/2])
                cube([width,20,sizeB], center=true);

            translate([0,0,-(sizeB+sizeC)])
                cube([sizeBottom+width*2, 20, width], center=true);

            biais();
            mirror([1,0,0]) {
                biais();
            }
        }
    }
}

leg();
