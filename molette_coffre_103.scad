include<lib.scad>

d_vis=5;
d_tete=12;
h_tete=3.5;
d_plot=d_tete+2;
h_plot=4;
w_fente=0.8;
h_fente=d_tete;
l_fente2=3.5;

n_grip=3;
d_grip=8;
d_molette=20;
h_molette=6;

difference() {

union() {
	molette(d_molette, h_molette, d_grip, n_grip);
	translate([0, 0, h_molette-0.1])
		cylinder(d=d_plot, h=h_plot, $fn=60);
}

translate([0, 0, h_molette+h_plot-h_tete/2])
difference() {
	intersection() {
		cylinder(d=d_tete, h=h_tete*1.5, center=true, $fn=60);
		translate([0,0,d_tete/4])
			sphere(d=d_tete, $fn=60);
	}
	
	cube([d_tete, w_fente, h_fente], center=true);
	rotate([0,0,90]) 
		cube([l_fente2, w_fente, h_fente], center=true);
}

translate([d_molette*0.5, 0, 0])
	cylinder(h=h_molette*4, d=3, center=true, $fn=20);
}

