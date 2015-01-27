use <octagon_ch.scad>

module plate(width, depth, thickness, corner_cut, cutout_dist, chamfer, bolt_space, bolt_hole=3, bolt_res=16)
{
  boolean_extra=1;

  color([0.95,0.95,0.95])
  difference()
  {
    octagon_ch(width, depth, thickness, corner_cut, chamfer);
    translate([-width/2+bolt_space, -depth/2+bolt_space, 0])
    cylinder(d=bolt_hole, h=thickness+boolean_extra, center=true, $fn=bolt_res);
    translate([width/2-bolt_space, -depth/2+bolt_space, 0])
    cylinder(d=bolt_hole, h=thickness+boolean_extra, center=true, $fn=bolt_res);
    translate([width/2-bolt_space, depth/2-bolt_space, 0])
    cylinder(d=bolt_hole, h=thickness+boolean_extra, center=true, $fn=bolt_res);
    translate([-width/2+bolt_space, depth/2-bolt_space, 0])
    cylinder(d=bolt_hole, h=thickness+boolean_extra, center=true, $fn=bolt_res);
    //cool looking cutout
    translate([0,0,thickness-chamfer])
    octagon_ch(width-cutout_dist, depth-cutout_dist, thickness, corner_cut, chamfer);
  }
}
