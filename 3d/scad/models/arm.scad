include <ollo.scad>;

module arm() {
    color([0.6,0.6,0.6]) {
        difference() {
            cylinder(d=20, h=OlloWidth);
            servoArm(OlloWidth);
        }
    }
}

arm();
