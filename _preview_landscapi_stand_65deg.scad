include <./_landscapi_stand_base.scad>
use <./landscapi_opiz_mount.scad>
use <./landscapi_lcd_driver_shim.scad>

$fn=50;

DEG=65;

rotate([0, 180 + DEG, 0]) {
  // LCD
  %
  translate([HOLDER_LCD_BOTTOM_T, 0, HOLDER_FRONT_T]) 
  lcd(margin=0, draw_display_region=true);

  translate([0, LCD_Y/2-50, 0]) 
  landscapi_stand_base(stand_deg=DEG);

  translate([0, -LCD_Y/2+50, 0]) 
  landscapi_stand_base(stand_deg=DEG);

  translate([0, -LCD_Y/2+10, 0]) 
  landscapi_opiz_mount();

  translate_landscapi_lcd_module_shim_for_preview()
  landscapi_lcd_driver_shim();
}