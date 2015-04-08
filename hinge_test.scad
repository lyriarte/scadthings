include<lib.scad>

portee=6;
vis=4;
hinge_l=30;
hinge_w=3;
hinge_p=5;
hinge_h=12;
hinge_j=0.2;

translate([0, portee,0]) rotate([0,0,0])
  hinge_n(portee,vis,hinge_l,hinge_w,hinge_h,hinge_j,n=2,base_h=5);
translate([0,-portee,0]) rotate([0,0,180])
#  hinge_n(portee,vis,hinge_l,hinge_w,hinge_h,hinge_j,n=3,base_h=5);

translate([0,0,0])
rotate([0,90,0])
%  hinge_lock(vis, (hinge_w*5+hinge_j*4) * 1.5, vis, 0.5);

