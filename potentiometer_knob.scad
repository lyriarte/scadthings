jeu=0.4;

grp_d=6;
grp_h=6;
grv_w=1;
bas_d=8;
bas_h=6;
knb_d=12;
knb_h=18;

pnt_f=3/2;
pnt_a=90;

module knob(d,h,f,a,j) {
	difference() {
		hull() {
			cylinder(d=d, h=h, $fn=36);
			rotate([0,0,a]) polyhedron(
				points = [ 
					[d*f/2, 0, 0], [-d*f/3, d*f/5, 0], [-d*f/3,-d*f/5, 0],
					[d*f/2, 0, h], [-d*f/3, d*f/5, h], [-d*f/3,-d*f/5, h],
				], 
				faces = [ [0,1,2], [0,1,4,3], [1,2,5,4], [0,2,5,3], [3,4,5]]
			);
		}
		translate([0,0,-0.5])
			cylinder(d=bas_d+j, h=bas_h+1, $fn=36);
		translate([0,0,bas_h])
			difference() {
				cylinder(d=grp_d+j, h=grp_h, $fn=36);
				translate([-(grp_d+1)/2,-(grv_w-j)/2,-0.5])
					cube([grp_d+1, grv_w-j, grp_h+1]);
			}
	}
}

rotate([180,0,0])
	knob(knb_d,knb_h,pnt_f,pnt_a,jeu);

