module backing_plate()
{

      difference()
      {
      octagon_ch(cutout_dist+corner_cut*2, cutout_dist+corner_cut*2, thickness, corner_cut, chamfer);
      translate([-bolt_space, -bolt_space, 0])
      cylinder(d=bolt_hole, h=thickness+boolean_extra, center=true, $fn=bolt_res);
	  translate([-bolt_space, bolt_space, 0])
      cylinder(d=bolt_hole, h=thickness+boolean_extra, center=true, $fn=bolt_res);
	  }

}
