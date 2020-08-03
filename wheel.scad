include <lib.scad>

module axis() {
	cylinder(d=8, h=60, center=true, $fn=6);
}


translate([30,0,0]) rotate([0,90,0])
difference() {
    wheel(60, 3, 6, n_grip=0, groove_d=2);
#    axis();
}

translate([-30,0,0]) rotate([0,90,0])
difference() {
    wheel(80, 8, 24, n_grip=72, groove_d=0);
#    axis();
}

translate([0,0,0]) rotate([0,90,0])
difference() {
    wheel(4, 8, 24, n_grip=72, groove_d=0);
#    axis();
}

