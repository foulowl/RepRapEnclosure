//Origin is center of bottom of printer 

use <octagon_ch.scad>
use <m3_bolt.scad>

  /////
  // Variables
  ////

  // total space between the plates
  space = 0.5; 

  width = 420; 
  height = 372; 
  depth = 402; 

  //One number, assume bed is bed_width x bed_width 
  bed_width = 180;

  num_x = ceil(width / bed_width);
  num_y = ceil(depth / bed_width);
  num_z = ceil(height / bed_width);

  plate_x = width/num_x - space*(num_x-1)/num_x;
  plate_y = depth/num_y - space*(num_y-1)/num_y; 
  plate_z = height/num_z - space*(num_z-1)/num_z;

  // how much of the corner is chopped 
  // off, x and y, to make each plate an octogon
  corner_cut = 10;  

  bolt_space = 15; 
  bolt_hole = 3;

  //thickness of each plate
  thickness = 2; 
  chamfer = 0.5;
  boolean_extra = 1;

  //cool looking cutout
  //distance from edge
  cutout_dist=40;

  bolt_res=8;

  render_bolts=true;

  //Main plates
  //these two can be combined, but it is more readable this way
//  translate([plate_x/2, plate_y/2, 0])
//  translate([-width/2, -depth/2, height])
  for (i = [0 : num_x-1])
  {
    for (j = [0 : num_y-1])
    { 
      translate([i * (plate_x + space), j * (plate_y + space), 0])
      {
      color([0.95,0.95,0.95])
      difference()
      {
        
	    octagon_ch(plate_x, plate_y, thickness, corner_cut, chamfer);
        translate([-plate_x/2+bolt_space, -plate_y/2+bolt_space, 0])
        cylinder(d=bolt_hole, h=thickness+boolean_extra, center=true, $fn=bolt_res);
        translate([plate_x/2-bolt_space, -plate_y/2+bolt_space, 0])
        cylinder(d=bolt_hole, h=thickness+boolean_extra, center=true, $fn=bolt_res);
        translate([plate_x/2-bolt_space, plate_y/2-bolt_space, 0])
        cylinder(d=bolt_hole, h=thickness+boolean_extra, center=true, $fn=bolt_res);
        translate([-plate_x/2+bolt_space, plate_y/2-bolt_space, 0])
        cylinder(d=bolt_hole, h=thickness+boolean_extra, center=true, $fn=bolt_res);
	    //cool looking cutout
        translate([0,0,thickness/2])
	    octagon_ch(plate_x-cutout_dist, plate_y-cutout_dist, thickness, corner_cut, chamfer);
      }
       if (render_bolts)
       {
       translate([-plate_x/2+bolt_space, -plate_y/2+bolt_space,4]) 
       rotate([0, 180, 0])
       m3_bolt(6);
       translate([plate_x/2-bolt_space, -plate_y/2+bolt_space,4]) 
       rotate([0, 180, 0])
       m3_bolt(6);
       translate([plate_x/2-bolt_space, plate_y/2-bolt_space,4]) 
       rotate([0, 180, 0])
       m3_bolt(6);
       translate([-plate_x/2+bolt_space, plate_y/2-bolt_space,4]) 
       rotate([0, 180, 0])
       m3_bolt(6);
       }
       }
    }
  }
 
//backing plates 
  color([0.85,0.85,0.85])
  for (i = [0:num_x-2])
  {
    for (j = [0:num_y-2])
    {
      translate([plate_x/2+i*plate_x, plate_y/2+j*plate_y, -thickness])
      difference()
      {
      octagon_ch(cutout_dist+corner_cut*2, cutout_dist+corner_cut*2, thickness, corner_cut, chamfer);
      translate([-bolt_space, -bolt_space, 0])
      cylinder(d=bolt_hole, h=thickness+boolean_extra, center=true, $fn=bolt_res);
	  translate([-bolt_space, bolt_space, 0])
      cylinder(d=bolt_hole, h=thickness+boolean_extra, center=true, $fn=bolt_res);
	  }
    }
  }
 

//cube([plate_x, plate_z, thickness]);

//generate names for each plate
//

