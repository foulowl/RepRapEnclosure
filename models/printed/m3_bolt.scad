module m3_bolt(length)
{
  boolean_extra=0.5;
  res=8;
  //head
  color([0.2, 0.2, 0.2])
  difference(){
    cylinder(d=5.5, h=3.0, $fn=8);
	//TO DO: confirm accuracy on the hex cutout, specifially diameter
    translate([0, 0, -boolean_extra])
    cylinder(d=2.5, h=2.0, $fn=6);
  }
  //shaft
  color([0.2, 0.2, 0.2])
  translate([0, 0, 3.0])
  cylinder(d=3.0, h=length, $fn=res); 
}