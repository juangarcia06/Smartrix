// WS2812 / WS2812b Led Matrix Diffuser by malebuffy

PCB_HEIGHT = 68; // Size of PCB in mm
PCB_WIDTH = 267; // Size of PCB in mm267
NUMBER_LEDS_HORIZONTAL=32; // Number of Leds in a row
NUMBER_LEDS_VERTICAL=8;   // Number of Leds in a column
DIFFUSER_HEIGHT = 2; // Height of diffuser
LED_SIZE = 5; // Size of leds in mm
DISTANCE_BETWEEN_LEDS=3.3; // Distance between leds in mm
WALL_THINKESS=1; // Thinkess of walls
PCB_BORDER = 1;  // PCB Outer Boarder in mm
ROUNDED_END_RADIUS = 35;
buffer=DISTANCE_BETWEEN_LEDS-WALL_THINKESS;



difference() {

// Create Main PCB Diffuser
    hull() {
        cube([PCB_HEIGHT,PCB_WIDTH,DIFFUSER_HEIGHT]);
        
        translate([PCB_HEIGHT/2, 0, 0]) cylinder(h = DIFFUSER_HEIGHT+2, r = ROUNDED_END_RADIUS *1.2, center = true);
        translate([PCB_HEIGHT - ROUNDED_END_RADIUS, 0, 0]) cylinder(h = DIFFUSER_HEIGHT, r = ROUNDED_END_RADIUS, center = true);
        
        translate([PCB_HEIGHT/2, PCB_WIDTH, 0]) cylinder(h = DIFFUSER_HEIGHT+2, r = ROUNDED_END_RADIUS *1.2, center = true);
    }
    
for ( i = [0:NUMBER_LEDS_HORIZONTAL-1] ) {
    
    translate([PCB_BORDER,(LED_SIZE+DISTANCE_BETWEEN_LEDS)*i,-1])
    
    for ( j = [0:NUMBER_LEDS_VERTICAL-1] ) {
        
     translate([(LED_SIZE+DISTANCE_BETWEEN_LEDS)*j,PCB_BORDER,-1]) cube([LED_SIZE+buffer,LED_SIZE+buffer,DIFFUSER_HEIGHT+5]);   
        
        
        
  }
 }
 
    // split to print in small printer
/*translate([-50,-ROUNDED_END_RADIUS*1.2, -DIFFUSER_HEIGHT-1]) {
    cube([PCB_HEIGHT*2, PCB_WIDTH/2+33, DIFFUSER_HEIGHT*5]);
    }
    
// split to print in small printer
translate([-50, PCB_WIDTH/2-9, -DIFFUSER_HEIGHT-1]) {
    cube([PCB_HEIGHT*2, PCB_WIDTH, DIFFUSER_HEIGHT*5]);
}*/
    
    
}