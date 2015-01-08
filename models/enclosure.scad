//Enclosure for Prusa Mendel i3
//Plate frame

width = 420;
height = 370;
depth = 400;
//1/8" plexiglass
thickness = 3.175; 

//front wall
translate([0, depth/2+thickness/2, 0])
cube([width, thickness, height], center=true);

//back wall
translate([0, -depth/2-thickness/2, 0])
cube([width, thickness, height], center=true);

//left wall
translate([width/2+thickness/2, 0, 0])
cube([thickness, depth, height], center=true);

//right wall
translate([-width/2-thickness/2, 0, 0])
cube([thickness, depth, height], center=true);

//bottom
translate([0, 0, -height/2-thickness/2])
cube([width, depth, thickness], center=true);

//top
translate([0, 0, height/2+thickness/2])
cube([width, depth, thickness], center=true);