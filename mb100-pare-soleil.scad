include<lib.scad>

tube_d=10.5;
tube_h=13;
tube_d1=4;
tube_h1=5;
tube_d2=7.5;

hold_w=14;
hold_l=60;
hold_t=6;
hold_angle=30;
hold_port=30;


portee=3;
vis=4;
hinge_l=20;
hinge_w=3;
hinge_p=5;
hinge_h=tube_h;
hinge_j=0.5;

module hold_fixe() {
difference() {
	union() {
		cylinder(d=tube_d, h=tube_h, $fn=30);
		hull() {
			translate([hold_t,-hold_w/2,tube_h/2]) rotate([0,270,0])
				hull_box(tube_h,hold_w,hold_t*2,1, center=false);
			translate([0,-hold_w/2,tube_h*3/2-2]) rotate([0,270-hold_angle,0])
				hull_box(hold_l,hold_w,hold_t,1, center=false);
		}
		 rotate([0,-hold_angle,0]) translate([1,-hold_w/2,hold_l+tube_h*3/2-hold_w/2]) union() {
				hull_box(hold_port,hold_w,hold_t,1, center=false);
				translate([hold_port/2 + hold_t,hold_w/2,hinge_l-hold_t]) rotate([270,0,0])
				hinge_n(portee,vis,hinge_l,hinge_w,hinge_h,j=hinge_j,n=3);
			}

	}
    translate([0,0,-1])
        cylinder(d=tube_d1, h=tube_h+2, $fn=15);
    translate([0,0,tube_h1])
        cylinder(d=tube_d2, h=hold_l/2, $fn=15);
    translate([hold_t-3,0,tube_h+2+hold_w/2]) rotate([90,340,0])
		scale([1,2,1])
        cylinder(d=tube_d, h=hold_w*1.1, $fn=15, center=true);
}
}

module hold_mobile() {
 difference() {
  union() {
	hinge_n(portee,vis,hinge_l,hinge_w,hinge_h*1.2,j=hinge_j,n=2);
	translate([hinge_w+hinge_j,hinge_l/2,0]) union() {
		hull_box((hinge_w+hinge_j)*5,hold_t,hold_w*1.2,1, center=true);
        translate([hold_t*0.28,-(hold_w-portee)*0.48,-1.2*hold_w/2]) rotate([90,0,0])
            hull_box((hinge_w+hinge_j)*5+hold_t*1.2/2,hold_t/2,hold_w*1.2,0.5, center=true);
		rotate([180,0,0]) translate([hinge_w*2,-3,-1.2*hold_w/2])
			hull_box(hold_t,hinge_l+hold_l*1.5,hold_w*1.2,1, center=false);
	}
  }
  translate([0,-portee,0]) rotate([0,90,0])
    cylinder(d=vis+hinge_j, h=12*hinge_w, center=true,$fn=15);
 }
}

%rotate([90,0,0]) hold_fixe();

translate([-4,-52,0]) rotate([180,0,-hold_angle]) translate([0,45,0]) 
hold_mobile();
