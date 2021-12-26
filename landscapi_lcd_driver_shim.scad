include <scad-utils/mirror.scad>
include <scad-utils/morphology.scad>

$fn=50;

SHIM_X=45;
SHIM_Y=55.5;
SHIM_Z=6;
SHIM_BASE_Z=1;

LCDD_HOLES_BETWEEN_X=39;
LCDD_MOUNT_X=6;
LCDD_MOUNT_Z=SHIM_Z;
LCDD_MOUNT_Y=LCDD_MOUNT_X+4;

module translate_landscapi_lcd_module_shim_for_preview() {
  translate([SHIM_X/2+20, 0, SHIM_Z/2 + 5])
  children(0);
}

module lcd_driver_mount_holes() {
  mirror_x()
  mirror_y()
  translate([LCDD_HOLES_BETWEEN_X/2, SHIM_Y/2 - 3, SHIM_Z-4])
  cylinder(d=1.8, h=10, center=!true);
}

module lcd_driver_mount_base() {
  mirror_x()
  mirror_y()
  translate([LCDD_HOLES_BETWEEN_X/2, SHIM_Y/2 - 3, 0]){

    linear_extrude(height=SHIM_Z, center=!true, convexity=10, twist=0)
    rounding(r=1)
    square(size=[LCDD_MOUNT_X, LCDD_MOUNT_X], center=true);
  }
}

module lcd_driver_mount(holes=false) {
  if (holes){
    lcd_driver_mount_holes();
  }else{
    lcd_driver_mount_base();
  }
}

module landscapi_lcd_driver_shim() {
  difference(){
    union(){
      linear_extrude(height=SHIM_BASE_Z, center=!true, convexity=10, twist=0)
      rounding(r=1)
      square([SHIM_X, SHIM_Y], center=true);

      lcd_driver_mount();
    }

    // screw holes
    lcd_driver_mount(holes=true);

    // diff for cross-braces
    linear_extrude(height=SHIM_Z, center=true, convexity=10, twist=0)
    rounding(r=1)
    difference(){
      square([SHIM_X, SHIM_Y], center=true);

      // cross
      mirror_y()
      hull(){
        translate([SHIM_X/2, SHIM_Y/2, 0]) 
        circle(d=6);
        translate([-SHIM_X/2, -SHIM_Y/2, 0]) 
        circle(d=6);
      }

      // shell
      shell(d=-6)
      square([SHIM_X, SHIM_Y], center=true);
    }
  }
}

landscapi_lcd_driver_shim();
