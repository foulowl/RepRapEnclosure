//Enclosure for Prusa Mendel i3
//Plate frame

//RAMPS board, arduino, and power supply should not be inside enclosure

////
// Variables
////
width = 420;
height = 370;
depth = 400;

//1/8" plexiglass
thickness = 3.175; 

//extra thickness to avoid screendoor effect 
boolean_extra=1.0;

bottom_corner_height=30;
bottom_corner_length=50;
bottom_corner_thickness=5;
bottom_corner_color=([0.1, 0.1, 0.1]);

////
//front wall
color([0.8, 0.2, 0.2])
translate([0, depth/2+thickness/2, 0])
cube([width, thickness, height], center=true);

//back wall
color([0.2, 0.8, 0.8])
translate([0, -depth/2-thickness/2, 0])
cube([width, thickness, height], center=true);

//left wall
color([0.8, 0.8, 0.2])
translate([width/2+thickness/2, 0, 0])
cube([thickness, depth+thickness*2, height], center=true);

//right wall
color([0.2, 0.2, 0.8])
translate([-width/2-thickness/2, 0, 0])
cube([thickness, depth+thickness*2, height], center=true);

//bottom
//color([0.8, 0.2, 0.8])
//translate([0, 0, -height/2-thickness/2])
//cube([width+thickness*2, depth+thickness*2, thickness], center=true);

//top
color([0.2, 0.8, 0.2])
translate([0, 0, height/2+thickness/2])
difference()
{
  cube([width+thickness*2, depth+thickness*2, thickness], center=true);
  //slots for top of frame spool holder
  translate([60, 0, 0])
  cube([60, 40, thickness+boolean_extra], center=true);
  translate([-60, 0, 0])
  cube([60, 40, thickness+boolean_extra], center=true);
	
  //filament inlet
  translate([0, -60, 0])
  cylinder(h=thickness+boolean_extra, r=3/2, center=true);
}

//4 top corners

//4 middle corners
color(bottom_corner_color)
translate([width/2-bottom_corner_length/2+bottom_corner_thickness+thickness, depth/2-bottom_corner_length/2+bottom_corner_thickness+thickness, 0])
union()
{
  translate([bottom_corner_length/2-bottom_corner_thickness/2, 0, 0])
  cube([bottom_corner_thickness, bottom_corner_length, bottom_corner_height], center=true);
  translate([0, bottom_corner_length/2-bottom_corner_thickness/2, 0])
  cube([bottom_corner_length, bottom_corner_thickness, bottom_corner_height], center=true);
}