include<lib.scad>

tube_d=10.5;
tube_h=13;
tube_d1=4;
tube_h1=5;
tube_d2=7.5;

hold_w=14;
hold_l=60;
hold_t=6;
hold_angle=25;
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
		translate([0,-hold_w/2,tube_h/2]) rotate([0,270,0])
			hull_box(tube_h,hold_w,hold_t,1, center=false);
		translate([0,-hold_w/2,tube_h*3/2-2]) rotate([0,270-hold_angle,0])
			hull_box(hold_l,hold_w,hold_t,1, center=false);
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
}
}

rotate([90,0,0]) hold_fixe();
