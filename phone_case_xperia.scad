include<phone_case.scad>

xperia_l=137;
xperia_w=70;
xperia_h=8;

mur=2;
rebord=4;
jeu=0.6;
courbure=3;

portee=1.5;
vis=4;
hinge_l=15;
hinge_w=3;
hinge_p=5;
hinge_h=12;
hinge_j=0.2;

module phone_case_xperia() {
    translate([0, (xperia_w+hinge_l+mur)/2, 0])
        rotate([180,0,0])
        hinge_n(portee,vis,hinge_l,hinge_w,hinge_h,hinge_j,n=3);
    difference() {
        phone_case(xperia_l,xperia_w,xperia_h,mur,rebord,jeu,courbure);
#        translate([15,-xperia_w/2,0]) rotate([90,0,0]) hull() {
            translate([-6,0,0]) cylinder(d=8,h=10,center=true);
            translate([ 6,0,0]) cylinder(d=8,h=10,center=true);
        }
#        translate([ 35, xperia_w/2,0]) cube([20,30,9],center=true);
#        translate([-15,-xperia_w/2,0]) cube([35,30,7],center=true);
#        translate([xperia_l/2,xperia_w/2-15,0]) rotate([0,90,0]) hull() {
            translate([0,-4,0]) cylinder(d=8,h=10,center=true);
            translate([0, 4,0]) cylinder(d=8,h=10,center=true);
        }
    }
}
