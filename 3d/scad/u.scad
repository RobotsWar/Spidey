include <common.scad>;

UHeight = 0;
URadius = 8;

module U()
{
  module Ubranch() {
    union() {  
     cylinder(Width, 10, 10);
       translate([-10,0,0])
   	      cube([20, 10+UHeight, Width]);
    }
  }

  module USide() {
    difference() {
      union() {
        Ubranch();
        translate([-10,10+UHeight+URadius-Width,URadius])
          cube([20,Width,15-(URadius-Width)]);
        translate([-10,10+UHeight,URadius]) {
          rotate([0,90,0]) {
            difference() {
              cylinder(20,URadius,URadius,$fn=30);
              cylinder(20,URadius-Width,URadius-Width,$fn=30);
              translate([-10+URadius-Width,-10,0])
                cube([10,10,20]);
              translate([-10,-20+URadius-Width,0])
               cube([10,20,20]);
            }
          }
        }
      }
      servoArm(depth=6);
    }
  }

  USide();
  mirror([0,0,1]) translate([0,0,-2*Width-30])  
    USide();
}

U();
