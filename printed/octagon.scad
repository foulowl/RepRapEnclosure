module octagon(width, depth, h, corner)
{
  p0=([-width/2+corner, -depth/2]);
  p1=([-width/2, -depth/2+corner]);
  p2=([-width/2, depth/2-corner]);
  p3=([-width/2+corner, depth/2]);
  p4=([width/2-corner, depth/2]);
  p5=([width/2, depth/2-corner]);
  p6=([width/2, -depth/2+corner]);
  p7=([width/2-corner, -depth/2]);

  linear_extrude(height=h, center=true)
  polygon(points=[p0, p1, p2, p3, p4, p5, p6, p7],
                  paths=[[0, 1, 2, 3, 4, 5, 6, 7]]);
}