include<lib.scad>

base_l=40;
base_w=20;
base_h=8;
back_d=8;
open_w=12;
clamp_h=35;
vis=4;
tete_vis=8;
ecart_vis=20;
grip_w=12;
grip_h=14;
grip_d=6;


module pass_vis(angle) {
    rotate([0,0,angle]) union()  {
        cylinder(d=vis, h=base_h*2, center=true);
        translate([base_l/4,0,base_h/2])
            cube([base_l/2,tete_vis,3], center=true);
        translate([0,0,base_h/2])
            cylinder(d=tete_vis, h=3, center=true);
    }
}

module clamp() {
    difference() {
        translate([0,0,clamp_h/2])
            hull_box(base_l,base_w,clamp_h+2, 2, center=true);
        translate([0,0,-0.5])
            cube([base_l,base_w,2], center=true);
        translate([0,0,base_h+clamp_h/2])
            cube([base_l,open_w,clamp_h], center=true);
        translate([ecart_vis/2,0,base_h/2])
            pass_vis(0);
        translate([-ecart_vis/2,0,base_h/2])
            pass_vis(180);
    }
	difference() {
		translate([0,0,base_h+clamp_h/3])
			cube([12,open_w*1.05,clamp_h*3/4], center=true);
		translate([0,0,base_h+clamp_h*0.8]) scale([1,1,3]) rotate([0,90,0])
#			cylinder(d=open_w, h=12.05, center=true);
	}
    translate([0,(base_w+grip_w)/2,grip_h])
    difference() {
        hull_box(base_l,grip_w+4,grip_d+3, 4, center=true);
#        translate([0,-0.2,grip_d*0.2-grip_h/2])
            cube([base_l,grip_w,grip_h], center=true);
    }
}

module spacer(h) {
    difference() {
        cube([base_l,base_w,h], center=true);
        translate([ecart_vis/2,0,h/2])
#            cylinder(d=back_d, h=h*3, center=true);
        translate([-ecart_vis/2,0,h/2])
#            cylinder(d=back_d, h=h*3, center=true);
    }
}
 

clamp();

%spacer(1.5);
