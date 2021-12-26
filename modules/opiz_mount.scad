include <scad-utils/mirror.scad>

include <./lcd_holder_base.scad>

OPIZ_HOLES_BETWEEN_X=40.5;
OPIZ_HOLES_BETWEEN_Y=42;

OPIZ_MOUNT_X=4;
OPIZ_MOUNT_Z=1.5;
OPIZ_MOUNT_Y=OPIZ_MOUNT_X+4;

module opiz_mount_holes() {
  mirror_x()
  translate([OPIZ_HOLES_BETWEEN_X/2, 0, -1.5]) 
  cylinder(d=1.8, h=10, center=!true);
}

module opiz_mount_base() {
  mirror_x()
  translate([OPIZ_HOLES_BETWEEN_X/2, 0, 0]){
    // trapezoid
    hull(){
      // top
      translate([0, 0, OPIZ_MOUNT_Z])
      linear_extrude(height=0.01, center=!true, convexity=10, twist=0)
      square(size=[OPIZ_MOUNT_X, OPIZ_MOUNT_X], center=true);

      // bottom
      linear_extrude(height=0.01, center=!true, convexity=10, twist=0)
      square(size=[OPIZ_MOUNT_X, OPIZ_MOUNT_Y], center=true);
    }
  }
}

module opiz_mount(holes=false) {
  translate([-OPIZ_HOLES_BETWEEN_X/2 - OPIZ_MOUNT_X/2 + HOLDER_X - 3, 0, HOLDER_Z])
  if (holes){
    opiz_mount_holes();
  }else{
    opiz_mount_base();
  }
}

