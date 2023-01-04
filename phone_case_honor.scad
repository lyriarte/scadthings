include<phone_case.scad>

hn_l=168;
hn_w=78;
hn_h=9.5;

mur=2;
rebord=5;
jeu=0.4;
courbure=4;

portee=1.8;
vis=4;
hinge_l=16;
hinge_w=3;
hinge_p=5;
hinge_h=12;
hinge_j=0.2;

module phone_case_hn() {
    translate([0, (hn_w+hinge_l+mur)*0.49, 0])
        rotate([180,0,0])
        hinge_n(portee,vis,hinge_l,hinge_w,hinge_h,hinge_j,n=3);
    difference() {
        phone_case(hn_l,hn_w,hn_h,mur,rebord,jeu,courbure);
#        translate([ 20,-hn_w/2,0]) cube([50,8,6],center=true);
#        translate([(-hn_l+rebord)/2,-20,-6]) cylinder(d=27,h=2);
    }
}

phone_case_hn();

