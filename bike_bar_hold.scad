include<lib.scad>

grip_l=12;
grip_d=22.5;
grip_delta=50;

portee=1.5;
vis=4;
hinge_l=15;
hinge_w=3;
hinge_h=12;


translate([-grip_delta,0,0]) rotate([0,90,0])
	tube_lock(portee, vis, hinge_l, hinge_w, hinge_h, grip_l, grip_d, 1, false);
translate([ grip_delta,0,0]) rotate([0,90,0])
	tube_lock(portee, vis, hinge_l, hinge_w, hinge_h, grip_l, grip_d, 1, false);

translate([-grip_delta,0,0]) rotate([0,90,0]) rotate([0,0,180])
%	tube_lock(portee, vis, hinge_l, hinge_w, hinge_h, grip_l, grip_d, 2, false);
translate([ grip_delta,0,0]) rotate([0,90,0]) rotate([0,0,180])
%	tube_lock(portee, vis, hinge_l, hinge_w, hinge_h, grip_l, grip_d, 2, false);

translate([0,0,(grip_d+hinge_w)/2]) difference() {
    hull() {
        cube([grip_delta*2+grip_l, grip_d/2, hinge_w], center=true);
        translate([0,0,hinge_w*3])
            cube([hinge_w*10, grip_d/2, hinge_w], center=true);
    }
    hull_box(hinge_w*18, grip_d, hinge_w*4, 5, center=true);
}
    


translate([0,0,35]) rotate([270,0,0])
    hinge_n(4.5,vis,25,hinge_w,grip_d/2,0.5,4,3);

