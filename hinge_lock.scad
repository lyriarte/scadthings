include<lib.scad>

n=5;
portee=6;
vis=4;
hinge_l=30;
hinge_w=3;
hinge_p=5;
hinge_h=12;
hinge_j=0.2;

rotate([90,0,0])
  hinge_lock(vis, (hinge_w*n+hinge_j*(n-1)) * 1.5, vis, 0.5);

