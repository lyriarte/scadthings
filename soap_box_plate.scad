include<lib.scad>

soap_l=44;
soap_w=55;
soap_h=27;

jeu=5;
in_l=soap_l+jeu;
in_w=soap_w+jeu;
in_h=soap_h+jeu;

box_t=3;
box_l=in_l+box_t;
box_w=in_w+box_t;
box_h=in_h+box_t;

nll=4;
nwl=3;
rl=5.5;

nlw=4;
nww=3;
rw=5;

nlh=4;
nwh=4;
rh=6.5;

c=3;

rfeet=8;
plate_w=rfeet+box_h;
plate_l=rfeet+box_w;
plate_h=rfeet;
plate_c=rfeet/2;

translate([0,0,box_l/2]) rotate([0,270,0])
    soap_closed_box(box_l, box_w, box_h, in_l, in_w, in_h, c, jeu,
        nll,nwl,rl, nlw,nww,rw, nlh,nwh,rh);
translate([0,0,rfeet/2])
    soap_hold_feet((rfeet+box_h)*1.06,(rfeet+box_w)*1.06,rfeet);
    
translate([0,0,-rfeet])
    difference() {
        scale([1.1,1.1,1])
            hull_box(plate_w,plate_l,plate_h,plate_c);
        translate([0,0,plate_h*0.2])
            hull_box(plate_w,plate_l,plate_h,plate_c);
        translate([0,0,plate_h/2])
            cube([plate_w*1.2,plate_l*1.2,plate_h], center=true);
    }
 