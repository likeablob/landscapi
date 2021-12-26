include <./lcd.scad>

HOLDER_X=LCD_X+3;
HOLDER_Y=10;
HOLDER_Z=9;
HOLDER_LCD_BOTTOM_T=1.5;
HOLDER_FRONT_T=1.5;

module holder_base() {
  translate([HOLDER_X/2, 0, HOLDER_Z/2]) 
  cube(size=[HOLDER_X, HOLDER_Y, HOLDER_Z], center=true);
}

module holder_diff() {
  // space for LCD
  translate([HOLDER_LCD_BOTTOM_T, 0, HOLDER_FRONT_T]) 
  lcd(0.5);

  // window for LCD
  LCD_CENTER_X=LCD_X/2 + HOLDER_LCD_BOTTOM_T;
  translate([LCD_CENTER_X, 0, 0]) 
  cube(size=[LCD_DISP_X+4, HOLDER_Y*2, 3], center=true);
}