LCD_X=64.3;
LCD_Y=232.0;
LCD_Z=4.9;
LCD_DISP_X=58;

module lcd(margin=0, draw_display_region=false) {
  translate([LCD_X/2, 0, LCD_Z/2]){
    cube(size=[LCD_X+margin, LCD_Y+margin, LCD_Z+margin], center=true);

    if(draw_display_region){
      translate([0, -2, 0]) 
      color("green", 0.5)
      cube(size=[LCD_DISP_X, LCD_Y-8, LCD_Z], center=true);
    }
  }
}
