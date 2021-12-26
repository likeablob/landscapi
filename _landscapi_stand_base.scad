include <scad-utils/morphology.scad>

include <./modules/lcd.scad>
include <./modules/lcd_holder_base.scad>
include <./modules/opiz_mount.scad>

STAND_X=50;
STAND_Y=HOLDER_Y;
STAND_Z_MIN=1;

module stand(deg) {
  hull() {
    // plane for hull
    translate([0.1/2, 0, HOLDER_Z/2]) 
    cube(size=[0.1, HOLDER_Y, HOLDER_Z], center=true);

    // stand body
    difference(){
      translate([-tan(90-deg) * HOLDER_Z , 0, 0]) 
      rotate([0, 180 - deg, 0]) 
      translate([-STAND_X/2, 0, 0]) 
      linear_extrude(height=STAND_Z_MIN, center=!true, convexity=10, twist=0)
      rounding(r=1)
      square(size=[STAND_X, STAND_Y], center=true);

      // flatten with XY plane
      translate([0, 0, -10/2]) 
      cube(size=[100, STAND_Y+1, 10], center=true);
    } 
  }
}

module landscapi_stand_base(stand_deg=75) {
  difference(){
    union(){
      stand(deg=stand_deg);
      holder_base();

      // Orange Pi Zero mount
      opiz_mount();
    }

    holder_diff();

    // Orange Pi Zero mount (screw holes)
    opiz_mount(holes=true);
  }
}
