include <./_landscapi_stand_base.scad>

$fn=50;

DEG=75;
// LCD
%
translate([HOLDER_LCD_BOTTOM_T, 0, HOLDER_FRONT_T]) 
lcd(margin=0, draw_display_region=true);

landscapi_stand_base(stand_deg=DEG);