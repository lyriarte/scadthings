hold_t=3;
hold_w=20;
hold_l1=50;
hold_l2=35;
hold_d=10;
hold_dl1=16;

difference() {
hull() {
	cube([hold_w,hold_l1,hold_t], center=true);
	translate([0,hold_l1/2-hold_dl1,0])
		cube([hold_l2,1,hold_t], center=true);
}
translate([0,hold_l1/2-hold_dl1-hold_d/4,0])
	cylinder(d=hold_d, h=hold_t*2, center=true);
}
