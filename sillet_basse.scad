include <lib.scad>

E=2.2;
A=2;
D=1.6;
G=1.2;

delta=10;
f_jeu=1.2;

l=38;
w=3.2;
h=4.8;

r_curve=350;
f_curve=0.8;

rotate([90,0,0]) intersection() {
difference() {
	hull_box(l, w, h, 0.4, center=true);
	translate([-delta*3/2,0,h/2*f_curve])
		rotate([90,0,0])
#		cylinder(d=E*f_jeu, h=w*2, center=true, $fn=30);
	translate([-delta*1/2,0,h/2])
		rotate([90,0,0])
#		cylinder(d=A*f_jeu, h=w*2, center=true, $fn=30);
	translate([ delta*1/2,0,h/2])
		rotate([90,0,0])
#		cylinder(d=D*f_jeu, h=w*2, center=true, $fn=30);
	translate([ delta*3/2,0,h/2*f_curve])
		rotate([90,0,0])
#		cylinder(d=G*f_jeu, h=w*2, center=true, $fn=30);
	translate([0,0,-(r_curve+h/4)])
		rotate([90,0,0])
		cylinder(r=r_curve, h=w*2, center=true, $fn=300);	
}
	translate([0,0,-(r_curve-h/2)])
		rotate([90,0,0])
		cylinder(r=r_curve, h=w*2, center=true, $fn=300);	
}

