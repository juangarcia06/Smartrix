// Clock design by BananaC9 / Juan García

PCB_HEIGHT = 68; // Size of PCB in mm
PCB_WIDTH = 267; // Size of PCB in mm267
NUMBER_LEDS_HORIZONTAL=32; // Number of Leds in a row
NUMBER_LEDS_VERTICAL=8;   // Number of Leds in a column
DIFFUSER_HEIGHT = 4; // Height of diffuser
LED_SIZE = 5; // Size of leds in mm
DISTANCE_BETWEEN_LEDS=3.3; // Distance between leds in mm
WALL_THICKNESS=1; // Thinkess of walls
PCB_BORDER = 1;  // PCB Outer Boarder in mm
ROUNDED_END_RADIUS = 35;
buffer=DISTANCE_BETWEEN_LEDS-WALL_THICKNESS;
THICK_BORDER = PCB_BORDER - WALL_THICKNESS;


difference() {

// Create Main PCB Diffuser
    union() {
        hull() {
            cube([PCB_HEIGHT, PCB_WIDTH, DIFFUSER_HEIGHT]);
            translate([PCB_HEIGHT/2, 0, 0]) cylinder(h = DIFFUSER_HEIGHT + 2, r = ROUNDED_END_RADIUS * 1.2, center = true);
            translate([PCB_HEIGHT - ROUNDED_END_RADIUS, 0, 0]) cylinder(h = DIFFUSER_HEIGHT, r = ROUNDED_END_RADIUS, center = true);
            translate([PCB_HEIGHT/2, PCB_WIDTH, 0]) cylinder(h = DIFFUSER_HEIGHT + 2, r = ROUNDED_END_RADIUS * 1.2, center = true);
        }
    }
 
/*   
    // split to print in small printer
translate([-50,-ROUNDED_END_RADIUS*1.2, -DIFFUSER_HEIGHT-1]) {
    cube([PCB_HEIGHT*2, PCB_WIDTH/2+33, DIFFUSER_HEIGHT*5]);
    }
// split to print in small printer
translate([-50, PCB_WIDTH/2-9, -DIFFUSER_HEIGHT-1]) {
    cube([PCB_HEIGHT*2, PCB_WIDTH, DIFFUSER_HEIGHT*5]);
}
*/
}