include <./modules/lcd.scad>
include <./modules/lcd_holder_base.scad>
include <./modules/opiz_mount.scad>

$fn=50;


module landscapi_opiz_mount() {
  difference(){
    union(){
      holder_base();

      // Orange Pi Zero mount
      opiz_mount();
    }

    holder_diff();

    // Orange Pi Zero mount (screw holes)
    opiz_mount(holes=true);
  }
}

// LCD
%
translate([HOLDER_LCD_BOTTOM_T, 0, HOLDER_FRONT_T]) 
lcd(margin=0, draw_display_region=true);

landscapi_opiz_mount();