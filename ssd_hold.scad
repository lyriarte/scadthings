include <lib.scad>

sh_l=100;
sh_w=10;
sh_h=10;
dv_1=6;
dv_2=2;

module ssd_hold(l, w, h, v1=0, v2=0, j=0.2, ssd_l=100, ssd_w=70, ssd_h=7) {
	difference() {
	hull() {
		translate([0,0,ssd_h+j*2-h])
			hull_box(l,w,h-ssd_h,2);
		translate([0,0,0])
			hull_box(ssd_w,w,h,2);
	}
	translate([0,0,-(h-ssd_h)/2]) rotate([0,0,90])
#		hull_box(ssd_l+j,ssd_w+j,ssd_h+j,0.5);
	translate([ l/2-v1,0,h-ssd_h]) rotate([0,0,90])
		cylinder(d=v1,h=h,center=true,$fn=15);
	translate([ l/2-v1,0,0]) rotate([0,0,90])
		cylinder(d=v2,h=h+j*2,center=true,$fn=15);
	translate([-l/2+v1,0,h-ssd_h]) rotate([0,0,90])
		cylinder(d=v1,h=h,center=true,$fn=15);
	translate([-l/2+v1,0,0]) rotate([0,0,90])
		cylinder(d=v2,h=h+j*2,center=true,$fn=15);
	}
}

ssd_hold(sh_l,sh_w,sh_h,dv_1,dv_2);

