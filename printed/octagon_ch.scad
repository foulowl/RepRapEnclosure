use <octagon.scad>

//ch is chamfer distance orthogonal to flat edge. 
//ie, it is not the diag dist.
//
//There is no shrinking of the corner edges, but there is 
//shrinking of the edges orthogonal to the x and y axes
module octagon_ch(width, depth, h, corner, ch)
{
  hull(){
    octagon(width, depth, h-ch*2, corner);
    octagon(width-ch*2, depth-ch*2, h, corner);
  }
}